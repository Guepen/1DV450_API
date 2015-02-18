require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Should not save without a username' do
    user = User.create(email: 'good@mail.com', password: 'qwerty', password_confirmation: 'qwerty')
    assert_not user.save
  end

  test 'username should not be to short' do
    user = User.create(username: 'te', email: 'bad@mail',
                       password: 'qwerty', password_confirmation: 'qwerty')
    assert_not user.valid?
  end

  test 'username should not be to long' do
    user = User.create(username: 'a'*51 , email: 'good@mail.com',
                       password: 'qwerty', password_confirmation: 'qwerty')
    assert_not user.valid?
  end

  test 'should not save a user whos username are less than 3 characters' do
    user = User.create(username: 'te', email: 'good@mail.com', password: 'qwerty', password_confirmation: 'qwerty')
    assert_not user.save
  end

  test 'should not save without a password' do
    user = User.create(username: 'testUser', email: 'good@mail.com')
    assert_not user.save
  end

  test 'password should have a minimum length' do
    user = User.create(username: 'testUser', email: 'good@mail.com')
    user.password = user.password_confirmation = 'a' * 5
    assert_not user.valid?
  end

  test 'should not save without email' do
    user = User.create(username: 'testUser', password: 'qwerty', password_confirmation: 'qwerty')
    assert_not user.save
  end

  test 'email should not be to long' do
    user = User.create(username: 'testUser', password: 'qwerty', password_confirmation: 'qwerty')
    user.email = 'a' * 244 + '@example.com'
    assert_not user.valid?
  end

  test 'should accept valid emails' do
    user = User.create(username: 'testUser', password: 'qwerty', password_confirmation: 'qwerty')
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      assert user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'should not accept invalid emails' do
    user = User.create(username: 'testUser', password: 'qwerty', password_confirmation: 'qwerty')
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      assert_not user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'emails should be unique' do
    user = User.create(username: 'testUser', email: 'good@mail.com',
                       password: 'qwerty', password_confirmation: 'qwerty')
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    assert_not duplicate_user.valid?
  end

  test 'should save' do
    user = User.create(username: 'testUser', email: 'good@mail.com',
                       password: 'qwerty', password_confirmation: 'qwerty')
    assert user.save
  end

  test 'should get the user by username' do
    user = User.find_by_username('kalle')
    assert_not_nil user
    assert_equal('kalle', user.username)
  end

  test 'user should hav an api_key' do
    api_key = Apikey.new
    api_key.generate_api_key
    user = User.create(username: 'testUser', email: 'good@mail.com', password: 'qwerty', password_confirmation: 'qwerty',
                       apikey: api_key)

    assert user.save


  end

  test 'should not save if chosen username exists' do
    user = User.create(username: 'testUser', email: 'good@mail.com',
                       password: 'qwerty', password_confirmation: 'qwerty')
    user.save

    bad_user = User.create(username: 'testUser', email: 'good@mail.com',
                           password: 'qwerty', password_confirmation: 'qwerty')

    assert_not bad_user.save

  end

end

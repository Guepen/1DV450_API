require 'test_helper'

class ApikeyTest < ActiveSupport::TestCase
 test 'apikey should have a user' do
   apikey = Apikey.new
   user = User.new

   apikey.user = user
   user.username = 'haoj'
   user.password = '$gthfvffgbf'

   apikey.key = '$hgfgbvfvd'


   assert apikey.save
 end

  test 'should not save an apikey without a user' do
    apikey = Apikey.new
    apikey.key = 'thgrverf'

    assert_not apikey.save
  end

  test 'should generate an APIKey' do
    apikey = Apikey.new
    key = apikey.generate_api_key
    assert_equal(50, key.length)
  end
end

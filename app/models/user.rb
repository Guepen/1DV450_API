class User < ActiveRecord::Base
  has_one :apikey
  validates_length_of :username, within: 3..50, :message => '^Användarnamnet måste vara mellan 3-50 tecken'
  validates_uniqueness_of :username, message: '^Användarnamnet är upptaget'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_length_of :email, maximum: 255, :message => 'Emailadressen får max vara 255 tecken'
  validates_format_of :email, with: VALID_EMAIL_REGEX, message: '^Ogiltlig email'
  validates_uniqueness_of :email, case_sensitive: false, message: '^Det finns redan en användare med angiven email'
  has_secure_password validations: false
  validates_length_of :password, minimum: 6, message: '^Lösenordet måste vara minst 6 tecken'
  validates_confirmation_of :password, message: '^Lösenorden måste matcha varandra'
  validates_length_of :password_confirmation, minimum: 6, message: '^Bekräfta lösenordfältet måste vara minst 6 tecken'
end
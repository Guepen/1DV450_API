class Creator < ActiveRecord::Base
  has_many :coffeehouses
  has_secure_password
end

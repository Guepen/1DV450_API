require 'securerandom'

class Apikey < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :key, presence: true, uniqueness: true

  def generate_api_key
    self.key = SecureRandom.hex(25)
  end
end

class Creator < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :coffeehouses, dependent: :destroy
  has_secure_password

  validates_length_of :username, within: 3..50
  validates_length_of :firstName, minimum: 3, maximum: 50
  validates_length_of :lastName, minimum: 3, maximum: 50
  validates_length_of :password, minimum: 6, maximum: 50


  def serializable_hash (options={})
    options = {
        only: [:firstName, :lastName, :username]
    }.update(options)
    json = super(options)
    json['url'] = self_url
    json
  end

  def self_url
    "#{Rails.configuration.baseurl}#{api_v1_creator_path(self)}"
  end

end

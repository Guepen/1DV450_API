class Creator < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :coffeehouses
  has_secure_password

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

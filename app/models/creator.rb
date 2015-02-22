class Creator < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :coffeehouses
  has_secure_password

  def serializable_hash (options={})
    options = {
        only: [:firstName, :lastName, :username]
    }.update(options)
    super(options)
  end

end

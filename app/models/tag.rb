class Tag < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_and_belongs_to_many :coffeehouses

  def serializable_hash (options={})
    options = {
        only: [:name]
    }.update(options)
    super(options)
  end
end

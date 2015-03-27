class Tag < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_and_belongs_to_many :coffeehouses


  validates_length_of :name, minimum: 1, maximum: 50
  validates_associated :coffeehouses
  def serializable_hash (options={})
    options = {
        only: [:id,:name]
    }.update(options)
    json = super(options)
    json['url'] = self_url
    json
  end

  private

  def self_url
    "#{Rails.configuration.baseurl}#{api_v1_tag_path(self)}"
  end
end

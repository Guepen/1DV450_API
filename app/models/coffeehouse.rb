class Coffeehouse < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :creator
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :tags

  reverse_geocoded_by :latitude, :longitude

  #TODO: validate

  def serializable_hash (options={})
    options = {
        only: [:name, :latitude, :longitude, :creator_id],
        methods: [:self_url]
    }.update(options)
    super(options)
  end

  def self_url
    { :url => "#{Rails.configuration.baseurl}#{api_v1_coffeehouse_path(self)}" }
  end
end

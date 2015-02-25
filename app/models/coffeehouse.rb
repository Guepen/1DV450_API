class Coffeehouse < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :creator
  has_and_belongs_to_many :tags, dependent: :destroy

  validates_presence_of :name, :latitude, :longitude
  validates_numericality_of :latitude, :longitude
  validates_length_of :name, minimum: 1, maximum: 50
  validates_associated :creator

  accepts_nested_attributes_for :tags

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address

  #TODO: validate

  def serializable_hash (options={})
    options = {
        only: [:name, :address, :location],
        include: {creator: {only: [:firstName, :lastName, :username]}, tags: {only: [:name]}},
    }.update(options)
    json = super(options)
    json['url'] = self_url
    self.tags.each.with_index { |tag, index|
      json['tags'][index]['url'] = tag_url(tag) if self.tags[index]
    }
    json['creator']['url'] = creator_url  if self.creator

    json
  end

  private
  def remove_tags
    ActionController::Base.helpers.strip_tags(self.name)
  end

  def self_url
    "#{Rails.configuration.baseurl}#{api_v1_coffeehouse_path(self)}"
  end

  def creator_url
    "#{Rails.configuration.baseurl}#{api_v1_creator_path(self.creator)}"
  end

  def tag_url(tag)
    "#{Rails.configuration.baseurl}#{api_v1_tag_path(tag)}"
  end


end

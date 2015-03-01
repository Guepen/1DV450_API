class Coffeehouse < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :creator
  has_and_belongs_to_many :tags, dependent: :destroy

  validates_presence_of :name, :street, :zipcode, :city
  #validates_length_of :name, minimum: 1, maximum: 50

  accepts_nested_attributes_for :tags

  geocoded_by :get_address
  after_validation :geocode # auto-fetch coordinates

  def serializable_hash (options={})
    options = {
        only: [:name, :latitude, :longitude, :street, :zipcode, :city],
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

  def self_url
    "#{Rails.configuration.baseurl}#{api_v1_coffeehouse_path(self)}"
  end

  def creator_url
    "#{Rails.configuration.baseurl}#{api_v1_creator_path(self.creator)}"
  end

  def tag_url(tag)
    "#{Rails.configuration.baseurl}#{api_v1_tag_path(tag)}"
  end

  def get_address
    [street, city, zipcode, 'Sweden'].compact.join(', ')
  end

end

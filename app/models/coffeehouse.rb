class Coffeehouse < ActiveRecord::Base
  belongs_to :creator
  has_and_belongs_to_many :tags
end

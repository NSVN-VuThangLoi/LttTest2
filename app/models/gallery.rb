class Gallery < ActiveRecord::Base
  attr_accessible :name, :image
  has_many :paintings
end

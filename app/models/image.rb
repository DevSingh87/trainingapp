class Image < ActiveRecord::Base
  belongs_to :tutorial
  attr_accessible :tutorial_id, :image
  mount_uploader :image, ImageUploader
  
end

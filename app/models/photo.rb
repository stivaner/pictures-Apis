class Photo < ActiveRecord::Base
  belongs_to :group, :class_name => "PhotosGroup"
  attr_accessible :description, :orderby, :pic, :title, :group_id

  mount_uploader :pic, PicUploader
end

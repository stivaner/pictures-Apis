class PhotosGroup < ActiveRecord::Base
  belongs_to :admin_users, :class_name => "AdminUser"
  has_many :photos

  belongs_to :parent, :class_name => 'PhotosGroup', :foreign_key => 'parent_id'
  has_many :children, :class_name => 'PhotosGroup', :foreign_key => 'parent_id'

  attr_accessible :orderby, :parent_id, :pic, :title, :admin_users_id

  mount_uploader :pic, PicUploader
end

ActiveAdmin.register Photo do
  index do
    column :pic do |photo|
      image_tag(photo.pic_url(:thumb).to_s)
    end
    column :group
    column :title
    default_actions
  end

  show do |photo|
    attributes_table do
      row :title
      row :group
      row :description
      row :pic do
        image_tag(photo.pic_url(:preview))
      end
    end
  end

  form :html => { :multipart => true } do |f|
    f.inputs "Photo" do
      f.input :group, :as => :select, :collection => PhotosGroup.all, :member_label => lambda { |i| i.title }
      f.input :title
      f.input :description
      f.input :pic, :as => :file
      f.input :orderby
    end
    f.buttons
  end
end

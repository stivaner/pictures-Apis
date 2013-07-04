ActiveAdmin.register PhotosGroup do
  index do
    column :pic do |group|
      image_tag(group.pic_url(:thumb).to_s)
    end
    column :parent
    column :title
    default_actions
  end

  show do |group|
    attributes_table do
       row :title
       row :parent
       row :admin_users_id
       row :pic do
         image_tag(group.pic_url(:preview))
       end
    end
  end

  form :html => { :multipart => true } do |f|
    f.inputs "PhotosGroup" do
      f.input :parent, :as => :select, :collection => PhotosGroup.all, :member_label => lambda { |i| i.title }
      f.input :title
      f.input :admin_users_id, :as => :hidden, :value => current_admin_user.id
      f.input :orderby
      f.input :pic, :as => :file
    end
    f.buttons
  end
end

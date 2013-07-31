ActiveAdmin.register News do
  index do
    column :title
    column :publication
    column :announce
    column :date_publication
    column :link

    default_actions
  end

  show do |photo|
    attributes_table do
      row :title
      row :publication
      row :announce
      row :body
      row :date_publication
      row :hard_title
      row :link
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :publication
      f.input :date_publication
      f.input :hard_title
      f.input :link
    end
    f.inputs "Announce" do
      f.input :announce, :label => ''
    end
    f.inputs "Body" do
      f.input :body, :label => '', :input_html => { :class => "tinymce_editor" }
    end
    f.actions
  end
end

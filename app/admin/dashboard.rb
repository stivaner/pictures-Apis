ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end
      column do
        panel "Recent News" do
          table_for News.order("created_at desc").limit(5) do
            column :name do |item|
              link_to(item.title, admin_news_path(item))
            end
            column :publication
          end
          strong { link_to "View All News", admin_news_index_path }
        end
       end

       column do
         panel "Recent Photos" do
           table_for Photo.order("created_at desc").limit(5) do
             column :image do |item|
               image_tag(item.pic_url(:thumb))
             end
             column :name do |item|
               link_to(item.title, admin_photo_path(item))
             end
             column :group do |item|
               link_to item.group.title, admin_photos_group_path(item.group)
             end
           end
           strong { link_to "View All Photos", admin_photos_path }
         end
       end
     end
  end # content
end

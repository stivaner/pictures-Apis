FactoryGirl.define do
  factory :user, class: AdminUser do
    #email 'admin@example.com'
    password 'password'
    sequence :email do |n|
      "admin#{n}@example.com"
    end
  end

  factory :photos_group, class: PhotosGroup do
    title 'Test photos groups'
    parent_id nil
    admin_users FactoryGirl.create(:user)
    pic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'uploder', 'darth-vader.jpg')) }
  end

  factory :photo, class: Photo do
    title 'Test photo'
    group FactoryGirl.create(:photos_group)
    description 'Its test photo'
    pic { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'uploder', 'darth-vader.jpg')) }
  end

  factory :news_item, class: News do
    id 1
    title 'Test news'
    announce 'Announce test news'
    body 'Body test news'
  end
end
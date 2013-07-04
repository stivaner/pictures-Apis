FactoryGirl.define do
  factory :user, class: AdminUser do
    email 'admin@example.com'
    password 'password'
  end

  factory :news_item, class: News do
    id 1
    title 'Test news'
    announce 'Announce test news'
    body 'Body test news'
  end
end
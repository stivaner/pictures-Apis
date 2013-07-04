class News < ActiveRecord::Base
  attr_accessible :announce, :body, :date_publication, :hard_title, :link, :publication, :title
end

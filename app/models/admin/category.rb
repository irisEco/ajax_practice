class Admin::Category < ApplicationRecord

  has_many :admin_articles, :class_name => 'Article'

end
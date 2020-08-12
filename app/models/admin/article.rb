class Admin::Article < ApplicationRecord

  belongs_to :admin_category, :class_name => 'Category'
end
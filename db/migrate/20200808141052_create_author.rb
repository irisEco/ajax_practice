class CreateAuthor < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :description
      t.string :phone
      t.integer :follower
    end
  end
end

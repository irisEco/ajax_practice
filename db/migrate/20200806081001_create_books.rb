class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :weight
      t.text :content
      t.timestamps
    end
  end
end

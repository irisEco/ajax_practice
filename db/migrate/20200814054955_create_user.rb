class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass
      t.string :phone
      t.integer :credits
      t.string  :email
      t.timestamps
    end
  end
end

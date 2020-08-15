class CreateUserCredit < ActiveRecord::Migration[6.0]
  def change
    create_table :user_credits do |t|
      t.string :description
      t.integer :credit
      t.timestamps
    end
  end
end

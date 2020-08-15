class AddUserCreditIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users,:user_credit_id ,:integer
  end
end

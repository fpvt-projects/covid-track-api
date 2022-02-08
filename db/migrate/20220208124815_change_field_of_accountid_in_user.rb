class ChangeFieldOfAccountidInUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :account_id
    add_column :users, :account_id, :integer
  end
end

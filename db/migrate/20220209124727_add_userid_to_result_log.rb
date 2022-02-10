class AddUseridToResultLog < ActiveRecord::Migration[7.0]
  def change
    add_column :result_logs, :user_id, :integer
  end
end

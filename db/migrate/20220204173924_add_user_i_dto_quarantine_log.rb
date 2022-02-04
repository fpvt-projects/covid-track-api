class AddUserIDtoQuarantineLog < ActiveRecord::Migration[7.0]
  def change
    add_column :quarantine_logs, :user_id, :integer
  end
end

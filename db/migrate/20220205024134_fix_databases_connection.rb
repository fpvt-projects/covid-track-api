class FixDatabasesConnection < ActiveRecord::Migration[7.0]
  def change
    add_column :quarantine_logs, :result_log_id, :integer
    rename_column :result_logs, :quarantinelog_id, :quarantine_log_id
  end
end

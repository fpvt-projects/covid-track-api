class RemoveQuaratineIdInResultsLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :result_logs, :quarantine_log_id
  end
end

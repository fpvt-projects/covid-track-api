class ChangeQuaratinelogToQuarantinelog < ActiveRecord::Migration[7.0]
  def change
    rename_table :quaratine_logs, :quarantine_logs
  end
end

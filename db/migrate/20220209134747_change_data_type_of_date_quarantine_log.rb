class ChangeDataTypeOfDateQuarantineLog < ActiveRecord::Migration[7.0]
  def change
    remove_column :quarantine_logs, :date
    add_column :quarantine_logs, :date, :date
  end
end

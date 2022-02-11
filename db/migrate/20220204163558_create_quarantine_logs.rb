class CreateQuarantineLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :quarantine_logs do |t|
      t.string :status
      t.date :date
      t.integer :user_id
      t.integer :result_log_id

      t.timestamps
    end
  end
end

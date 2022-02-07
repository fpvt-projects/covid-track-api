class CreateQuaratineLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :quaratine_logs do |t|
      t.string :status
      t.datetime :date

      t.timestamps
    end
  end
end

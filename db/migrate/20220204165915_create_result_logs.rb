class CreateResultLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :result_logs do |t|
      t.string :antigen_type
      t.string :result
      t.string :brand

      t.timestamps
    end
  end
end

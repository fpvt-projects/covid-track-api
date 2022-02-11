class CreateCaseCounts < ActiveRecord::Migration[7.0]
  def change
    create_table :case_counts do |t|
      t.integer :total_cases
      t.integer :total_recoveries
      t.integer :active_cases
      t.integer :daily_new
      t.integer :daily_recovered

      t.timestamps
    end
  end
end

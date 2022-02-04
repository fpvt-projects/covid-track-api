class AddQlogidToResultlog < ActiveRecord::Migration[7.0]
  def change
    add_column :result_logs, :quaratine_log_id, :integer
  end
end

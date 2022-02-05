class FixColumnNameForResultlog < ActiveRecord::Migration[7.0]
  def change
    rename_column :result_logs, :quaratine_log_id, :quarantinelog_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

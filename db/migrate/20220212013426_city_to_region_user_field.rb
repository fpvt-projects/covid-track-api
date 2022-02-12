class CityToRegionUserField < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :city, :region
    change_column :users, :birthdate, :date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

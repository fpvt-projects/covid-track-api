class ChangeAuthortoUserId < ActiveRecord::Migration[7.0]
  def change
    remove_column :journals, :author
    add_column :journals, :user_id, :string
  end
end

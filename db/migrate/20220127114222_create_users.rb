class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :lastname 
      t.string :middlename 
      t.string :firstname 
      t.string :address 
      t.string :city 
      t.string :cellnumber 
      t.string :gender
      t.date :birthdate
      t.integer :account_id
      
      t.timestamps
    end
  end
end

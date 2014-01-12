class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :password
      t.string :name
      t.string :surname1
      t.string :surname2
      t.string :photo
      t.string :email
      t.integer :type
      t.string :class_group
      
      t.timestamps
    end
  end
end

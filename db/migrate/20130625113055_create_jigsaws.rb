class CreateJigsaws < ActiveRecord::Migration
  def change
    create_table :jigsaws do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.string :phase
      t.integer :user_id
      
      t.timestamps
    end
  end
end

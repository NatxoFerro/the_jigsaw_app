class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :URL
      t.integer :resource_id
      
      t.timestamps
    end
  end
end

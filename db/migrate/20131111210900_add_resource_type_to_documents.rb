class AddResourceTypeToDocuments < ActiveRecord::Migration
   def change
    add_column :documents, :resource_type, :string
  end
end

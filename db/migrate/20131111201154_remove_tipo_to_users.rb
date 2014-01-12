class RemoveTipoToUsers < ActiveRecord::Migration
  remove_column :users, :tipo, :integer
end

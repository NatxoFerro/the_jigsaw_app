class RenameTypeToTipoInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :type, :tipo
  end
end

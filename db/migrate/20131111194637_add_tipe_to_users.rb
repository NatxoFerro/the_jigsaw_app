class AddTipeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tipe, :integer
  end
end
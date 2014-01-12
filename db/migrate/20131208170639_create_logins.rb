class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.integer :user

      t.timestamps
    end
  end
end

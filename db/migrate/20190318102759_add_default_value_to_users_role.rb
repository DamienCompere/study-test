class AddDefaultValueToUsersRole < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :integer, default: "support"
  end
end

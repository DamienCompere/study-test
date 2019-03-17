class AddFieldsToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :owner, :string
    add_column :bugs, :title, :string
    add_column :bugs, :description, :text
    add_column :bugs, :assignate, :string
  end
end

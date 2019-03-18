class AddDefaultValueToBugsSeverity < ActiveRecord::Migration[5.2]
  def change
    change_column :bugs, :severity, :integer, default: "trivial"
  end
end

class AddSeverityToBugs < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :severity, :integer
    add_index :bugs, :severity
  end
end

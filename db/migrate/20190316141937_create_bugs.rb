class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.integer :state

      t.timestamps
    end
    add_index :bugs, :state
  end
end

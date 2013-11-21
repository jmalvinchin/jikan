class CreateAddons < ActiveRecord::Migration
  def change
    create_table :addons do |t|
      t.integer :quantity
      t.belongs_to :entry
      t.belongs_to :item

      t.timestamps
    end
    add_index :addons, :entry_id
  end
end

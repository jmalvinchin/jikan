class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :customer_number
      t.datetime :start_time
      t.datetime :end_time
      t.decimal :total_cost

      t.timestamps
    end
  end
end

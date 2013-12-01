class AddAmountToAddon < ActiveRecord::Migration
  def change
    add_column :addons, :amount, :decimal
  end
end

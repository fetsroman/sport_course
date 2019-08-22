class AddBoughtCountToRates < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :bought_count, :integer, default: 0
  end
end

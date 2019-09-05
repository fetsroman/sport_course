class AddPriceToBoughtLists < ActiveRecord::Migration[5.2]
  def change
    add_column :bought_lists, :price, :integer
  end
end

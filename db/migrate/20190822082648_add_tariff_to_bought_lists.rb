class AddTariffToBoughtLists < ActiveRecord::Migration[5.2]
  def change
    add_column :bought_lists, :tariff, :string
  end
end

class AddCurrencyToBoughtLists < ActiveRecord::Migration[5.2]
  def change
    add_column :bought_lists, :currency, :string
  end
end

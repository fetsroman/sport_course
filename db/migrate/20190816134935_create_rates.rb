class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.string :title
      t.text :description
      t.integer :tariff
      t.integer :price
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :tariff
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

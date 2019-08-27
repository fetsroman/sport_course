class CreateWelcomes < ActiveRecord::Migration[5.2]
  def change
    create_table :welcomes do |t|
      t.string :header1
      t.string :content1
      t.string :header2
      t.string :content2
      t.string :header3
      t.string :for_you1
      t.string :for_you2
      t.string :for_you3
      t.string :for_you4
      t.string :for_you5
      t.string :for_you6
      t.string :content3
      t.string :header4
      t.string :content4
      t.string :header5
      t.string :content5
      t.string :header6
      t.string :header7
      t.string :content6
      t.string :price
      t.string :time
      t.string :client_number
      t.timestamps
    end
  end
end

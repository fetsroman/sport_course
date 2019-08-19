class CreateBoughtLists < ActiveRecord::Migration[5.2]
  def change
    create_table :bought_lists do |t|
      t.references :user
      t.integer :course_id

      t.timestamps
    end
  end
end

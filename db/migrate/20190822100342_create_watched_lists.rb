class CreateWatchedLists < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_lists do |t|
      t.references :user, foreign_key: true
      t.integer :course_id
      t.integer :lesson_id
      t.boolean :watch, default: false

      t.timestamps
    end
  end
end

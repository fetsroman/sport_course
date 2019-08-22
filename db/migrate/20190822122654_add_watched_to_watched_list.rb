class AddWatchedToWatchedList < ActiveRecord::Migration[5.2]
  def change
    add_column :watched_lists, :watched, :boolean, default: false
  end
end

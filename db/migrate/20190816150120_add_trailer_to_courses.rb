class AddTrailerToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :trailer, :string
  end
end

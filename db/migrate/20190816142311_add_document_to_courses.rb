class AddDocumentToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :document, :string
  end
end

class TranslateCourses < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Course.create_translation_table!({
                                            title: :string,
                                            description: :text
                                          }, {
                                              migrate_data: true
                                          })
      end

      dir.down do
        Course.drop_translation_table! migrate_data: true
      end
    end
  end
end

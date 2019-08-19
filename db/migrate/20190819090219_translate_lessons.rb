class TranslateLessons < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Lesson.create_translation_table!({
                                             title: :string,
                                             description: :text
                                         }, {
                                             migrate_data: true
                                         })
      end

      dir.down do
        Lesson.drop_translation_table! migrate_data: true
      end
    end
  end
end

class TranslateRates < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      dir.up do
        Rate.create_translation_table!({
                                             title: :string,
                                             description: :text,
                                             price: :integer
                                         }, {
                                             migrate_data: true
                                         })
      end

      dir.down do
        Rate.drop_translation_table! migrate_data: true
      end
    end
  end
end

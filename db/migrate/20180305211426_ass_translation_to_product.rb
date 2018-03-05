class AssTranslationToProduct < ActiveRecord::Migration[5.1]
  def up
  	Product.create_translation_table!({
  		title: :string,
        slug: :string,
  		sub_title: :string,
  		price: :decimal,
  		body: :text
  		}, {migrate_data: true})
    end

    def down
  	  Product.drop_translation_table!
    end
end

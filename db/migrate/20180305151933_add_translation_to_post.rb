class AddTranslationToPost < ActiveRecord::Migration[5.1]
  def up
  	Post.create_translation_table!({
  		title: :string,
      slug: :string,
  		sub_title: :string,
  		body: :text
  		}, {migrate_data: true})
  end

  def down
  	Post.drop_translation_table!
  end
end

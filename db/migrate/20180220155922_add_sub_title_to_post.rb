class AddSubTitleToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :sub_title, :string
  end
end

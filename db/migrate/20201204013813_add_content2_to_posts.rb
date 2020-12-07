class AddContent2ToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content2, :text
  end
end

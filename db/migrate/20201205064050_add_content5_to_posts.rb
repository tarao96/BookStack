class AddContent5ToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content5, :text
  end
end

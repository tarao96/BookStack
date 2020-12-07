class AddContent4ToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content4, :text
  end
end

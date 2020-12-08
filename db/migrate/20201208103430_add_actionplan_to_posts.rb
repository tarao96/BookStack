class AddActionplanToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :actionplan, :text
  end
end

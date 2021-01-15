class AddUserImageNameToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_image_name, :string
  end
end

class AddPostDocumentImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :post_document_image, :string
  end
end

class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.integer :post_id
      t.text :content6

      t.timestamps
    end
  end
end

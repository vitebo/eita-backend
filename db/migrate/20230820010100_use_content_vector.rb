class UseContentVector < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_content_classifications
    drop_table :contents

    create_table :contents do |t|
      t.string :title
      t.string :category
      t.string :kind
      t.text :raw_body
      t.text :body
      t.vector :embedding
    end

    create_table :user_content_classifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.string :classification

      t.timestamps
    end
  end
end

class CreateContent < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :category
      t.string :kind
      t.text :raw_body
      t.text :body
      t.json :embedding
    end
  end
end

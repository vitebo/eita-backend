class AddUserVector < ActiveRecord::Migration[7.0]
  def change
    drop_table :users_tags
    drop_table :tags
    drop_table :users

    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.vector :embeddings
      t.timestamps
    end

    create_table :tags do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :users_tags do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end
  end
end

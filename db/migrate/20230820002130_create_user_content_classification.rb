class CreateUserContentClassification < ActiveRecord::Migration[7.0]
  def change
    create_table :user_content_classifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.string :classification

      t.timestamps
    end
  end
end

class RenameUserVectorColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :embeddings, :embedding
  end
end

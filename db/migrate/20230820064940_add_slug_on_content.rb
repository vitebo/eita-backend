class AddSlugOnContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :slug, :string
  end
end

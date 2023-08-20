class AddImageOnContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :image_url, :string
  end
end

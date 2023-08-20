require 'csv'

class ImagesLoader
  def initialize
    CSV.foreach("tmp/revista-images.csv", headers: true) do |row|
      Content.find(row['id']).update_columns(image_url: row['cover_image_url'])
    rescue ActiveRecord::RecordNotFound => e
      next
    end
  end
end

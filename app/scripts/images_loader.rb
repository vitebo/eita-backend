require 'csv'

class ImagesLoader
  def initialize
    CSV.foreach("tmp/revista-images.csv", headers: true) do |row|
      Content.find(row['id']).update_columns(image_url: row['slug'])
    rescue ActiveRecord::RecordNotFound => e
      next
    end
  end
end

require 'csv'

class SlugLoader
  def initialize
    CSV.foreach("tmp/revista-slugs.csv", headers: true) do |row|
      Content.find(row['id']).update_columns(slug: row['slug'])
    rescue ActiveRecord::RecordNotFound => e
      next
    end
  end
end

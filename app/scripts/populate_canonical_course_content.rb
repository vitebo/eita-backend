require 'csv'

class PopulateCanonicalCourseContent
  def initialize
    Content.update_all(kind: 'post')

    CSV.foreach("tmp/course-content.csv", headers: true) do |row|
      doc = Nokogiri::HTML(row['job_description'])

      content = Content.create!(
        title: row['canonical'],
        category: row['career'],
        kind: 'course',
        raw_body: row['job_description'],
        body: doc.text,
        embedding: EmbeddingCalculator.new.calculate_embedding(doc.text),
        image_url: "https://singlecolorimage.com/get/33fd8f/400x100"
      )
    rescue ActiveRecord::RecordNotFound => e
      next
    end
  end
end

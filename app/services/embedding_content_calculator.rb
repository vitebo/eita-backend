class EmbeddingContentCalculator
  def initialize
    Content.all.each do |content|
      raw_body = content.raw_body
      doc = Nokogiri::HTML(raw_body)
      content.update(body: doc.text)
      content.update(embedding: EmbeddingCalculator.new.calculate_embedding(doc.text))
    rescue StandardError => e
      puts "Error: #{e}"
    end
  end
end

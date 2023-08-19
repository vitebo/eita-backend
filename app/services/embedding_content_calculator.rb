class EmbeddingContentCalculator
  def initialize
    Content.first(10).each do |content|
      raw_body = content.raw_body
      doc = Nokogiri::HTML(raw_body)
      content.update!(body: doc.text)
      content.update!(embedding: EmbeddingCalculator.new.calculate_embedding(doc.text))
    end
  end
end

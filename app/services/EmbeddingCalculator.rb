class EmbeddingCalculator
  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def calculate_embedding(embedd_data)
    response = @client.embeddings(
      parameters: {
          model: "text-embedding-ada-002",
          input: embedd_data
      }
    )

    response.dig("data", 0, "embedding")
  end
end

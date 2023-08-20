class ImageGenerator
  def initialize
    @client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])
  end

  def generate_image(context)
    puts "Generating image for #{context}"

    response = @client.images.generate(
      parameters: {
        prompt: "Generate a image about this course: #{context}",
        size: '256x256',
      }
    )

    url = response.dig("data", 0, "url")
    puts "Generated image url: #{url}"
    url
  end
end

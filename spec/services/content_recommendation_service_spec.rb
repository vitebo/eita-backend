require 'rails_helper'

RSpec.describe ContentRecommendationService do
  context "recommendations" do
    let(:user_embedding) { [0.5, 0.5] }
    let(:user) { User.create(name: "example", embedding: user_embedding) }
    let!(:content1) { Content.create(title: "content1", embedding: "[0.5, 0.5]") }

    context "when user has no liked nor disliked contents" do
      it "returns recommendations based on user tags" do
        calculator = double("EmbeddingCalculator")
        allow(calculator).to receive(:calculate_embedding).and_return([])

        expect(ContentRecommendationService.new(user.id, calculator).recommendations).to eq([{
          id: content1.id,
          title: content1.title,
          body: content1.body,
          slug: content1.slug,
          kind: content1.kind,
          image: content1.image_url,
          score: 0.9999999999999998
        }])
      end
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  context "calculating embeddings" do
    let(:tag1) { Tag.create(name: "vuejs") }
    let(:tag2) { Tag.create(name: "rails") }
    let(:user) { User.create(name: "example") }

    before do
      user.tags << [tag1, tag2]
    end

    it "calculate embeddings based on tags" do
      calculator = double("EmbeddingCalculator")
      allow(calculator).to receive(:calculate_embedding).and_return([0.5, 0.5])

      expect(calculator).to receive(:calculate_embedding).with(["vuejs", "rails"])
      expect(user.calculate_embedding(calculator)).to eq([0.5, 0.5])
    end
  end
end

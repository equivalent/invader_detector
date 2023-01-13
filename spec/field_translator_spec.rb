require "spec_helper"
RSpec.describe InvaderDetector::FieldTranslator do
  let(:result) { described_class.new(config: config).call(input) }

  context "positive's are o and negatives -" do
    let(:config) { instance_double(InvaderDetector::Config, positives: ["1"], negatives: ["0"]) }

    context "when positive value" do
      let(:input) { "1" }

      it "translates as a positive value" do
        expect(result).to be(true)
      end
    end

    context "when negative value" do
      let(:input) { "0" }

      it "translates as a negative value" do
        expect(result).to be(false)
      end
    end

    context "when unknown value" do
      let(:input) { "x" }

      it "raises an error" do
        expect { result }.to raise_error(InvaderDetector::FieldTranslator::UnrecognizedValueError, "Unknown value: x")
      end
    end
  end
end

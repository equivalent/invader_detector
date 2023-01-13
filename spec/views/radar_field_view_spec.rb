require "spec_helper"

RSpec.describe InvaderDetector::RadarFieldView do
  subject { described_class.new(radar_field, colorizer: colorizer, config: config) }
  let(:radar_field) do
    instance_double(InvaderDetector::RadarField,
                    probability: probability,
                    value: value,
                    low_probability_color: :low_probability_color,
                    medium_probability_color: :medium_probability_color,
                    high_probability_color: :high_probability_color)
  end
  let(:value) { true }
  let(:colorizer) { ->(color, str) { "#{color}_#{str}" } }
  let(:config) { instance_double(InvaderDetector::Config, negatives: ["n"], positives: ["p"]) }

  describe "#call" do
    context "when probability is 0..25" do
      let(:probability) { 0 }

      it "returns green color" do
        expect(subject.call).to eq("green_p")
      end

      context "when value is false" do
        let(:value) { false }

        it "returns green color" do
          expect(subject.call).to eq("green_n")
        end
      end
    end

    context "when probability is 26..50" do
      let(:probability) { 26 }

      it "returns light green color" do
        expect(subject.call).to eq("light_green_p")
      end
    end

    context "when probability is 51..75" do
      let(:probability) { 51 }

      it "returns light green color" do
        expect(subject.call).to eq("low_probability_color_p")
      end
    end

    context "when probability is 76..90" do
      let(:probability) { 76 }

      it "returns light green color" do
        expect(subject.call).to eq("medium_probability_color_p")
      end
    end

    context "when probability is 91..100" do
      let(:probability) { 91 }

      it "returns light green color" do
        expect(subject.call).to eq("high_probability_color_p")
      end

      context "when value is false" do
        let(:value) { false }

        it "returns green color" do
          expect(subject.call).to eq("high_probability_color_n")
        end
      end
    end
  end
end

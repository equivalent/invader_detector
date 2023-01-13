require "spec_helper"

RSpec.describe InvaderDetector::Invader do
  let(:invader_raw) { crab_invader_raw }
  subject(:invader) { described_class.parse(invader_raw) }

  describe ".parse" do
    it "returns Invader" do
      expect_any_instance_of(InvaderDetector::Parser).to receive(:call).with(invader_raw).and_call_original
      expect(described_class.parse(invader_raw)).to be_a(InvaderDetector::Invader)
    end
  end

  describe ".converter" do
    it "returns Field" do
      expect(described_class.converter(true)).to be_a(InvaderDetector::Field)
    end
  end

  describe "#rectangular" do
    it "returns invader rectangular of booleans" do
      expect(invader.rectangular).to be_a(Array)
      expect(invader.rectangular.size).to be(8)
      expect(invader.rectangular.first).to be_a(Array)

      row = invader.rectangular.first
      expect(row.size).to be(11)
      expect(row.select { |item| item.is_a?(InvaderDetector::Field) }.size).to be(11)
    end
  end

  describe "#compare" do
    it "calls RectangularProbabilityCalculator for result" do
      other_rectangular   = double("other_rectangular")
      invader_rectangular = double("invader_rectangular")
      result = double("result")

      expect(invader).to receive(:rectangular).and_return(invader_rectangular)

      expect(InvaderDetector::RectangularProbabilityCalculator)
        .to receive(:new)
        .with(invader_rectangular: invader_rectangular)
        .and_return(double(call: result))

      expect(invader.compare(other_rectangular)).to be(result)
    end
  end

  describe "#width" do
    it "returns invader width" do
      expect(invader.width).to be(11)
    end
  end

  describe "#height" do
    it "returns invader height" do
      expect(invader.height).to be(8)
    end
  end
end

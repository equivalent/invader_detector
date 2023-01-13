require "spec_helper"
RSpec.describe InvaderDetector::Parser do
  subject { described_class.new }
  let(:result) { subject.call(input) }

  context "when simple square" do
    let(:input) { "--\n--" }

    it "parses square" do
      expect(result).to eq([[false, false], [false, false]])
    end
  end

  context "when simple invader" do
    let(:input) { "o-\n-o\n--" }
    it "parses invader" do
      expect(result).to eq([[true, false], [false, true], [false, false]])
    end

    context "when convertor is given" do
      subject { described_class.new(converter: ->(bool) { bool ? "1" : "0" }) }
      it "returns converted values via converter" do
        expect(result).to eq([%w[1 0], %w[0 1], %w[0 0]])
      end
    end
  end

  context "when rectangle with wrong line count" do
    let(:input) { "o-\n-o-" }
    it "raises an error" do
      expect { result }.to raise_error(InvaderDetector::Parser::InvalidLineLengthError)
    end
  end

  context "when crab invader" do
    let(:input) { crab_invader_raw }

    it "parses crab invader" do
      expect(result).to be_a(Array)
      expect(result.size).to be(8)
      expect(result.first).to be_a(Array)
      expect(result.first.size).to be(11)
    end
  end
end

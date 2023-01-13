require "spec_helper"

RSpec.describe InvaderDetector::RectangularProbabilityCalculator do
  let(:subject) { described_class.new(invader_rectangular: invader_rectangular) }
  let(:result)  { subject.call(sample_rectangular) }

  let(:o) { InvaderDetector::Field.new(true) }
  let(:_) { InvaderDetector::Field.new(false) }

  context "simple invader" do
    let(:invader_rectangular) do
      [
        [_, o, _],
        [o, _, o],
        [_, o, _]
      ]
    end

    context "no match" do
      let(:sample_rectangular) do
        [
          [_, _, _],
          [_, _, _],
          [_, _, _]
        ]
      end

      it { expect(result).to eq(0) }
    end

    context "exact match" do
      let(:sample_rectangular) { invader_rectangular }

      it { expect(result).to eq(100) }
    end
  end
end

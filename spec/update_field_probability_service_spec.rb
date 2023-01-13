require "spec_helper"

RSpec.describe InvaderDetector::UpdateFieldProbabilityService do
  subject { described_class.new(radar: radar, invader: invader) }

  def rf_true
    InvaderDetector::RadarField.new(true)
  end

  def rf_false
    InvaderDetector::RadarField.new(false)
  end

  let(:rf00) { rf_true }
  let(:rf01) { rf_true }
  let(:rf10) { rf_false }
  let(:rf11) { rf_true }

  let(:radar) do
    [
      [rf00, rf01],
      [rf10, rf11]
    ]
  end

  let(:invader) do
    InvaderDetector::Invader.new(
      [
        [InvaderDetector::Field.new(true)],
        [InvaderDetector::Field.new(true)]
      ]
    )
  end

  describe "#call" do
    context "0, 0" do
      before { subject.call(0, 0) }

      it { expect(rf00.probability).to eq(50) }
      it { expect(rf01.probability).to eq(0) }
      it { expect(rf10.probability).to eq(50) }
      it { expect(rf11.probability).to eq(0) }
    end

    context "1, 0" do
      before { subject.call(1, 0) }

      it { expect(rf00.probability).to eq(0) }
      it { expect(rf01.probability).to eq(100) }
      it { expect(rf10.probability).to eq(0) }
      it { expect(rf11.probability).to eq(100) }
    end

    context "0, 1" do
      before { subject.call(0, 1) }

      it { expect(rf00.probability).to eq(0) }
      it { expect(rf01.probability).to eq(0) }
      it { expect(rf10.probability).to eq(0) }
      it { expect(rf11.probability).to eq(0) }
    end

    context "1, 1" do
      before { subject.call(1, 1) }

      it { expect(rf00.probability).to eq(0) }
      it { expect(rf01.probability).to eq(0) }
      it { expect(rf10.probability).to eq(0) }
      it { expect(rf11.probability).to eq(50) }
    end
  end
end

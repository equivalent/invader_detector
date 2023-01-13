require "spec_helper"

RSpec.describe InvaderDetector::RowProbabilityCalculator do
  subject { described_class.new(sample_row: sample_row, invader_row: invader_row) }

  let(:t) { instance_double(InvaderDetector::Field, positive?: true) }
  let(:f) { instance_double(InvaderDetector::Field, positive?: false) }

  context "3 cell row" do
    let(:invader_row) { [f, t, f] }

    context do
      let(:sample_row) { [f, f, f] }
      it { expect(subject.call).to eq(0) }
    end

    context "exact match" do
      let(:sample_row) { [f, t, f] }
      it { expect(subject.call).to eq(100) }
    end

    context "fuzzy match" do
      let(:sample_row) { [t, f, f] }
      it { expect(subject.call).to eq(0) }
    end
  end

  context "5 cell row with 2 positives" do
    let(:invader_row) { [f, t, f, t, f] }

    context do
      let(:sample_row) { [f, f, f, f, f] }
      it { expect(subject.call).to eq(0) }
    end

    context "exact match" do
      let(:sample_row) { [f, t, f, t, f] }
      it { expect(subject.call).to eq(100) }
    end

    context "half match" do
      let(:sample_row) { [f, t, f, f, f] }
      it { expect(subject.call).to eq(50) }
    end

    context "fuzze match" do
      let(:sample_row) { [t, f, f, f, f] }
      it { expect(subject.call).to eq(0) }
    end
  end

  context "5 cell row with 3 positives" do
    let(:invader_row) { [t, t, f, t, f] }

    context "1  match" do
      let(:sample_row) { [f, t, f, f, f] }
      it { expect(subject.call).to eq(33) }
    end
  end

  context "11 cell row with 7 positives" do
    let(:invader_row) { [f, f, t, t, t, t, t, t, t, f, f] }

    context "0 match" do
      let(:sample_row) { [t, f, f, f, f, f, f, f, f, f, f] }
      it { expect(subject.call).to eq(0) }
    end

    context "1 match mid" do
      let(:sample_row) { [f, f, f, f, f, t, f, f, f, f, f] }
      it { expect(subject.call).to eq(14) }
    end

    context "1 match end" do
      let(:sample_row) { [f, f, f, f, f, f, f, f, t, f, f] }
      it { expect(subject.call).to eq(14) }
    end

    context "2 match" do
      let(:sample_row) { [f, f, t, f, f, f, f, f, t, f, f] }
      it { expect(subject.call).to eq(29) }
    end

    context "3 match" do
      let(:sample_row) { [f, f, t, f, f, f, f, t, t, f, f] }
      it { expect(subject.call).to eq(43) }
    end

    context "4 match" do
      let(:sample_row) { [f, f, t, f, f, f, t, t, t, f, f] }
      it { expect(subject.call).to eq(57) }
    end

    context "5 match" do
      let(:sample_row) { [f, f, t, f, f, t, t, t, t, f, f] }
      it { expect(subject.call).to eq(71) }
    end

    context "6 match" do
      let(:sample_row) { [f, f, t, f, t, t, t, t, t, f, f] }
      it { expect(subject.call).to eq(86) }
    end

    context "7 match" do
      let(:sample_row) { [f, f, t, t, t, t, t, t, t, f, f] }
      it { expect(subject.call).to eq(100) }
    end
  end
end

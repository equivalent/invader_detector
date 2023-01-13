require "spec_helper"

RSpec.describe InvaderDetector::Field do
  subject { described_class.new(value) }

  describe "#initialize" do
    context "with non boolean value" do
      let(:value) { "foo" }
      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end

  describe "#==" do
    context "with same value" do
      let(:value) { true }
      let(:other) { described_class.new(value) }
      it { expect(subject == other).to be_truthy }

      context "with different class" do
        let(:other) { double(value: value) }
        it { expect(subject == other).to be_truthy }
      end
    end

    context "with different value" do
      let(:value) { true }
      let(:other) { described_class.new(false) }
      it { expect(subject == other).to be_falsey }

      context "with different class" do
        let(:other) { double(value: false) }
        it { expect(subject == other).to be_falsey }
      end
    end
  end

  context "true" do
    let(:value) { true }
    it { expect(subject.positive?).to be_truthy }
    it { expect(subject.negative?).to be_falsey }
  end

  context "false" do
    let(:value) { false }
    it { expect(subject.positive?).to be_falsey }
    it { expect(subject.negative?).to be_truthy }
  end
end

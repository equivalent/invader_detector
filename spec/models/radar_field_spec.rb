require "spec_helper"

RSpec.describe InvaderDetector::RadarField do
  subject { described_class.new(value) }
  let(:value) { true }

  describe "inheritance" do
    it { expect(subject).to be_kind_of InvaderDetector::Field }
    it { expect(subject.respond_to?(:positive?)).to be true }
    it { expect(subject.respond_to?(:negative?)).to be true }
  end

  describe "#update" do
    let(:invader) { instance_double(InvaderDetector::Invader) }
    before { subject.update(probability: 99, invader: invader) }

    it { expect(subject.probability).to eq(99) }
    it { expect(subject.probable_invader).to eq(invader) }
  end
end

require "spec_helper"

RSpec.describe InvaderDetector::Config do
  subject { described_class.new }

  it "has negative" do
    expect(subject.negatives).to eq(["-"])
  end

  it "has positive" do
    expect(subject.positives).to eq(%w[o O])
  end
end

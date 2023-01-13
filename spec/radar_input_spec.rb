require "spec_helper"

RSpec.describe InvaderDetector::RadarInput do
  subject { described_class.new(config: config) }

  let(:config) do
    instance_double(InvaderDetector::Config, outputer: ->(_body) { nil })
  end

  before do
    subject.inputer = -> { input }
  end

  context "when no input" do
    let(:input) { nil }

    it "loads default example" do
      expect(InvaderDetector::RadarLoader).to receive(:example).and_return("example")
      expect(subject.call).to eq "example"
    end
  end

  context "when  input non existing file" do
    let(:input) { "./data/non_existing_file" }

    it do
      expect(subject.call).to eq nil
    end
  end

  context "when  input existing file" do
    let(:input) { "./data/invaders/crab_invader.txt" }

    it do
      expect(subject.call).to be_kind_of String
    end
  end
end

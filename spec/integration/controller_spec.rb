require "spec_helper"

RSpec.describe InvaderDetector::Controller do
  include_context "shared controller helpers"

  subject { described_class.new(config: config) }

  let(:config) do
    InvaderDetector::Config.new.tap do |config|
      config.outputer = ->(body) { @output += body }
      config.sleep_time = 0
    end
  end

  before do
    subject.looper = single_iteration_looper
    @output = ""
  end

  it do
    subject.call
    expect(@output.size).to be_within(1_000).of(75_000)
  end
end

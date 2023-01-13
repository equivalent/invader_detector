require "spec_helper"
RSpec.describe InvaderDetector::Controller do
  include_context "shared controller helpers"

  subject { described_class.new(config: config) }

  let(:do_nothing_sleeper) { double("do_nothing_sleeper") }
  let(:config) { instance_double(InvaderDetector::Config, sleep_time: sleep_time) }
  let(:sleep_time) { double("sleep_time") }

  before do
    subject.looper = single_iteration_looper
    subject.sleeper = do_nothing_sleeper
  end

  describe "#call" do
    it "should not fail" do
      radar_screen = instance_double(InvaderDetector::RadarScreen)
      radar_updater = instance_double(InvaderDetector::RadarUpdater)
      radar_input = instance_double(InvaderDetector::RadarInput)
      radar_loader = instance_double(InvaderDetector::RadarLoader)
      expect(InvaderDetector::RadarScreen).to receive(:new).and_return(radar_screen)
      expect(InvaderDetector::RadarUpdater).to receive(:new).and_return(radar_updater)
      expect(InvaderDetector::RadarInput).to receive(:new).and_return(radar_input)
      expect(InvaderDetector::RadarLoader).to receive(:new).and_return(radar_loader)
      expect(do_nothing_sleeper).to receive(:call).with(sleep_time)
      expect(radar_updater).to receive(:call)
      expect(radar_screen).to receive(:down)
      expect(radar_screen).to receive(:render)
      expect(radar_screen).to receive(:clear)
      expect(radar_input).to receive(:call).and_return("radar_raw")
      expect(radar_loader).to receive(:call).with("radar_raw")
      subject.call
    end
  end
end

require "spec_helper"
RSpec.describe InvaderDetector::RadarScreen do
  subject { described_class.new(radar, config: config) }

  let(:config) { instance_double(InvaderDetector::Config) }
  let(:field1) { instance_double(InvaderDetector::RadarField) }
  let(:field2) { instance_double(InvaderDetector::RadarField) }
  let(:field3) { instance_double(InvaderDetector::RadarField) }
  let(:field4) { instance_double(InvaderDetector::RadarField) }

  let(:radar) do
    [
      [field1, field2],
      [field3, field4]
    ]
  end

  describe "#down" do
    it "moves radar down" do
      expect(config).to receive(:screen_shift).and_return(1)
      subject.down
      expect(subject.radar).to eq([[field3, field4], [field1, field2]])
    end
  end

  describe "#render" do
    it "renders radar" do
      radar_view_double = instance_double(InvaderDetector::RadarView)
      expect(InvaderDetector::RadarView)
        .to receive(:new)
        .with(radar)
        .and_return(radar_view_double)
      expect(radar_view_double)
        .to receive(:call)
        .and_return("RadarViewOutput")

      outputer_double = instance_double(Proc)
      expect(config).to receive(:outputer).and_return(outputer_double)
      expect(outputer_double).to receive(:call).with("RadarViewOutput")

      subject.render
    end
  end
end

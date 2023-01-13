require "spec_helper"

RSpec.describe InvaderDetector::RadarView do
  include_context "radar 2by2"

  subject { described_class.new(radar) }

  def expect_to_call_field_view(field, return_value)
    ret = instance_double(InvaderDetector::RadarFieldView, call: return_value)
    expect(InvaderDetector::RadarFieldView)
      .to receive(:new)
      .with(field)
      .and_return(ret)
  end

  describe "#call" do
    it "expect to call FieldView whit each field in metrix" do
      expect_to_call_field_view(radar_field_p00, "Fone")
      expect_to_call_field_view(radar_field_p01, "Ftwo")
      expect_to_call_field_view(radar_field_p10, "Fthree")
      expect_to_call_field_view(radar_field_p11, "Ffour")
      expect(subject.call).to eq("FoneFtwo\nFthreeFfour\n")
    end
  end
end

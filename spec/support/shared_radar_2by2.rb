RSpec.shared_context "radar 2by2" do
  let(:radar_field_p01) { instance_double(InvaderDetector::RadarField) }
  let(:radar_field_p10) { instance_double(InvaderDetector::RadarField) }
  let(:radar_field_p11) { instance_double(InvaderDetector::RadarField) }
  let(:radar_field_p00) { instance_double(InvaderDetector::RadarField) }

  let(:radar) do
    [
      [radar_field_p00, radar_field_p01],
      [radar_field_p10, radar_field_p11]
    ]
  end
end

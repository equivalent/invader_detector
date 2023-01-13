require "spec_helper"

RSpec.describe InvaderDetector::RadarUpdater do
  include_context "radar 2by2"

  let(:invader1) { instance_double(InvaderDetector::Invader) }
  let(:invader2) { instance_double(InvaderDetector::Invader) }
  let(:invaders) { [invader1, invader2] }

  subject { described_class.new(radar: radar, invaders: invaders) }

  def expect_call_ufp_service_with(invader, x, y)
    ufp_service = instance_double(InvaderDetector::UpdateFieldProbabilityService)

    expect(InvaderDetector::UpdateFieldProbabilityService)
      .to receive(:new)
      .with(radar: radar, invader: invader)
      .and_return(ufp_service)

    expect(ufp_service).to receive(:call).with(x, y)
  end

  it "expect to update field probability on each field in metrix for each invader" do
    invaders.each do |invader|
      expect_call_ufp_service_with(invader, 0, 0)
      expect_call_ufp_service_with(invader, 1, 0)
      expect_call_ufp_service_with(invader, 0, 1)
      expect_call_ufp_service_with(invader, 1, 1)
    end

    subject.call
  end
end

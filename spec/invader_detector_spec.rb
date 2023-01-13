RSpec.describe InvaderDetector do
  it "has a version number" do
    expect(InvaderDetector::VERSION).not_to be nil
  end

  it "has config" do
    expect(InvaderDetector.config).to be_a(InvaderDetector::Config)
  end
end

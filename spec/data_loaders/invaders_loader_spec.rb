require "spec_helper"

RSpec.describe InvaderDetector::InvadersLoader do
  let(:invaders) { subject.call }
  let(:invader1) { invaders[0] }
  let(:invader2) { invaders[1] }

  it "loads invaders" do
    expect(invaders).to be_a(Array)
    expect(invaders.size).to be(2)
  end

  it { expect(invader1).to be_a(InvaderDetector::Invader) }
  it {  expect(invader1.low_probability_color).to eq "yellow" }
  it {  expect(invader1.medium_probability_color).to eq "red" }
  it {  expect(invader1.high_probability_color).to eq "magenta" }

  it { expect(invader2).to be_a(InvaderDetector::Invader) }
  it { expect(invader2.low_probability_color).to eq "light_yellow" }
  it { expect(invader2.medium_probability_color).to eq "blue" }
  it { expect(invader2.high_probability_color).to eq "cyan" }
end

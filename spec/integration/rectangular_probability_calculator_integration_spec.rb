require "spec_helper"

RSpec.describe "invader compares rectangular probability when" do
  let(:invader)     { InvaderDetector::Invader.parse(crab_invader_raw) }
  let(:rectangular) { InvaderDetector::RadarLoader.new.call(rectangle_raw) }

  context "exact match" do
    let(:rectangle_raw) { crab_invader_raw }

    it do
      expect(invader.compare(rectangular)).to eq(100)
    end
  end

  context "close enough match" do
    let(:rectangle_raw) do
      <<~SQUARE
        --o------o-
        ---o---o---
        --ooo-ooo--
        -oo-ooo-oo-
        ooooooooooo
        o-ooooooo-o
        o-o-----o-o
        ---oo-oo---
      SQUARE
    end

    it do
      expect(invader.compare(rectangular)).to be_within(5).of(92)
    end
  end
end

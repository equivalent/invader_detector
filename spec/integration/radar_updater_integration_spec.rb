require "spec_helper"

RSpec.describe InvaderDetector::RadarUpdater do
  let(:service) { described_class.new(radar: radar, invaders: [invader]) }
  let(:invader) { InvaderDetector::Invader.parse(invader_raw) }
  let(:radar)   { InvaderDetector::RadarLoader.new.call(radar_raw) }

  def trigger
    service.call
  end

  def row_probability(row_number)
    radar[row_number].map(&:probability)
  end

  context "example1" do
    let(:radar_raw) do
      <<~RADAR
        --oo--
        --oo--
        oo--oo
        oooooo
      RADAR
    end

    let(:invader_raw) do
      <<~INVADER
        oo
        oo
      INVADER
    end

    it "initial state of all radar fields should be 0 probability" do
      radar.each_with_index do |_row, row_index|
        expect(row_probability(row_index)).to eq([0, 0, 0, 0, 0, 0])
      end
    end

    context "uppon trigger" do
      before { trigger }

      it { expect(row_probability(0)).to eq [0, 50, 100, 100, 50, 0] }
      it { expect(row_probability(1)).to eq [50, 50, 100, 100, 50, 50] }
      it { expect(row_probability(2)).to eq [100, 100, 75, 75, 100, 100] }
      it { expect(row_probability(3)).to eq [100, 100, 75, 75, 100, 100] }
    end
  end
end

module InvaderDetector
  class RadarView
    attr_reader :radar

    def initialize(radar)
      @radar = radar
    end

    def call
      out = ""
      radar.each do |row|
        r = ""
        row.each do |field|
          r += RadarFieldView.new(field).call
        end
        out += "#{r}\n"
      end
      out
    end
  end
end

module InvaderDetector
  class RadarFieldView
    extend Forwardable
    def_delegators :@radar_field, :value, :low_probability_color,
                   :medium_probability_color, :high_probability_color, :probability
    def_delegators :@config, :negatives, :positives

    def initialize(radar_field, config: InvaderDetector.config, colorizer: nil)
      @radar_field = radar_field
      @config = config
      @colorizer = colorizer
    end

    def call
      colorizer.call(color, symbol)
    end

    private

    def color
      case probability
      when 0..25   then :green
      when 26..50  then :light_green
      when 51..75  then low_probability_color.to_sym
      when 76..90  then medium_probability_color.to_sym
      when 90..100 then high_probability_color.to_sym
      end
    end

    def symbol
      value ? positives.first : negatives.first
    end

    def default_colorezer(color, str)
      ColorizedString.new(str).colorize(color)
    end

    def colorizer
      @colorizer || method(:default_colorezer)
    end
  end
end

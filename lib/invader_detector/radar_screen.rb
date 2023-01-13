module InvaderDetector
  class RadarScreen
    extend Forwardable
    def_delegators :config, :outputer

    attr_reader :radar, :config

    def initialize(radar, config: InvaderDetector.config)
      @radar = radar
      @config = config
    end

    def down
      rows = radar.shift(config.screen_shift)
      rows.each { |row| radar << row }
    end

    def render
      outputer.call InvaderDetector::RadarView.new(radar).call
    end

    def inspect
      "#<#{self.class.name}:#{object_id}>"
    end

    # will clear the screen
    def clear
      system("cls") || system("clear")
    end
  end
end

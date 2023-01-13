module InvaderDetector
  class Controller
    attr_reader :config
    attr_writer :looper, :sleeper

    def initialize(config: InvaderDetector.config)
      @config = config
    end

    def call
      invaders = InvadersLoader.new.call
      radar = load_radar
      radar_screen  = RadarScreen.new(radar, config: config)
      radar_updater = InvaderDetector::RadarUpdater.new(radar: radar, invaders: invaders)

      looper.call do
        step(radar_screen, radar_updater)
      end
    end

    private

    def step(radar_screen, radar_updater)
      radar_updater.call
      radar_screen.down
      radar_screen.render
      sleeper.call(config.sleep_time)
      radar_screen.clear
    end

    def load_radar
      radar_input = RadarInput.new(config: config).call
      exit unless radar_input
      InvaderDetector::RadarLoader.new.call(radar_input)
    end

    def looper
      @looper || defaut_looper
    end

    def sleeper
      @sleeper || default_sleeper
    end

    def default_sleeper
      ->(seconds) { sleep(seconds) }
    end

    def defaut_looper
      ->(&block) { loop(&block) }
    end
  end
end

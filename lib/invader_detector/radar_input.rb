module InvaderDetector
  class RadarInput
    extend Forwardable
    def_delegators :config, :outputer

    attr_writer :inputer
    attr_reader :config

    def initialize(config:)
      @config = config
    end

    def call
      radar_input_file = inputer.call
      if radar_input_file
        if File.exist?(radar_input_file)
          File.read(radar_input_file)
        else
          output_file_not_found(radar_input_file)
        end
      else
        InvaderDetector::RadarLoader.example
      end
    end

    private

    def inputer
      @inputer || -> { ARGV[0] }
    end

    def output_file_not_found(radar_input_file)
      msg  = %(File not found "#{radar_input_file}")
      msg += "Usage:\n\n"
      msg += "    invader_detector <path_to_radar_input_file>"
      msg += "\n\n"
      msg += "To run with example data no arguments are needed"
      outputer.call(msg)
      nil
    end
  end
end

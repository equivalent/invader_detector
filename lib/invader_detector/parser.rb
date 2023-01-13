module InvaderDetector
  class Parser
    InvalidLineLengthError = Class.new(StandardError)

    attr_reader :config, :converter

    def initialize(config: InvaderDetector.config, converter: ->(bool) { bool })
      @config = config
      @converter = converter
    end

    def call(invader_raw)
      invader_raw
        .split("\n")
        .map do |line|
          sanity_check(line)
          process_row(line.split("")).to_a
        end
    end

    private

    def process_row(row)
      row
        .lazy
        .map { |char| translate_value(char) }
        .map(&converter)
    end

    def translate_value(char)
      FieldTranslator.new(config: config).call(char)
    end

    def sanity_check(line)
      @line_size ||= line.size
      raise InvalidLineLengthError if line.size != @line_size
    end
  end
end

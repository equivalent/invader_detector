module InvaderDetector
  class FieldTranslator
    UnrecognizedValueError = Class.new(StandardError)

    attr_reader :config

    def initialize(config:)
      @config = config
    end

    def call(value)
      return true  if config.positives.include?(value)
      return false if config.negatives.include?(value)

      raise UnrecognizedValueError, "Unknown value: #{value}"
    end
  end
end

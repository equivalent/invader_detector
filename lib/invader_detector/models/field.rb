module InvaderDetector
  class Field
    attr_reader :value

    def initialize(value)
      raise ArgumentError, "value must be boolean" unless [true, false].include?(value)

      @value = value
    end

    def ==(other)
      value == other.value
    end

    def positive?
      value
    end

    def negative?
      !value
    end
  end
end

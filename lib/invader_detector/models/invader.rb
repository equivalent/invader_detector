module InvaderDetector
  class Invader
    attr_reader :rectangular
    attr_accessor :low_probability_color, :medium_probability_color, :high_probability_color

    def self.parse(rectangular_raw)
      new Parser.new(converter: public_method(:converter)).call(rectangular_raw)
    end

    def self.converter(bool)
      Field.new(bool)
    end

    def initialize(rectangular)
      raise ArgumentError, "Rectangular must be an Array" unless rectangular.is_a?(Array)
      raise ArgumentError, "Rectangular must consist of Field object" unless rectangular.first.first.is_a?(Field)

      @rectangular = rectangular
    end

    def width
      rectangular.first.size
    end

    def height
      rectangular.size
    end

    def compare(other_rectangular)
      RectangularProbabilityCalculator.new(invader_rectangular: rectangular).call(other_rectangular)
    end

    def inspect
      "#<#{self.class.name} width: #{width}, height: #{height}>"
    end
  end
end

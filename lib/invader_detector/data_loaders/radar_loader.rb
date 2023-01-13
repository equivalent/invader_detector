module InvaderDetector
  class RadarLoader
    def self.example
      File.read("./data/radar_example.txt")
    end

    def call(raw)
      Parser.new(converter: method(:converter)).call(raw)
    end

    private

    def converter(bool)
      RadarField.new(bool)
    end
  end
end

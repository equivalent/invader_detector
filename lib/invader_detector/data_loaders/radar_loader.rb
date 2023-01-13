module InvaderDetector
  class RadarLoader
    def self.example
      InvaderDetector.root.join("data", "radar_example.txt").read
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

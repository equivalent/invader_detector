module InvaderDetector
  class UpdateFieldProbabilityService
    attr_reader :radar, :invader

    def initialize(radar:, invader:)
      @radar = radar
      @invader = invader
    end

    def call(x, y)
      rectangular = rectangular_radar_sample(invader, x, y)
      probability = invader.compare(rectangular)
      write_probability_to_affected_fields(rectangular, probability)
    end

    private

    def rectangular_radar_sample(invader, x, y)
      radar.slice(y, invader.height).map do |row|
        row.slice(x, invader.width)
      end
    end

    def write_probability_to_affected_fields(rectangular, probability)
      rectangular.flatten.each do |field|
        field.update(probability: probability, invader: invader)
      end
    end
  end
end

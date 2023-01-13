module InvaderDetector
  class RadarUpdater
    attr_reader :radar, :invaders

    def initialize(radar:, invaders:)
      @radar = radar
      @invaders = invaders
    end

    def call
      radar.each_with_index.map do |row, y|
        row.each_with_index.map do |_field, x|
          invaders.each do |invader|
            UpdateFieldProbabilityService
              .new(radar: radar, invader: invader)
              .call(x, y)
          end
        end
      end
    end
  end
end

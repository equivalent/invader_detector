module InvaderDetector
  class RadarField < Field
    extend Forwardable
    def_delegators :@probable_invader, :low_probability_color,
                   :medium_probability_color, :high_probability_color

    attr_reader :probability, :probable_invader

    def initialize(value)
      super(value)
      @probability = 0
      @probable_invader = nil
    end

    def update(probability:, invader:)
      return if self.probability > probability

      @probability = probability
      @probable_invader = invader
    end
  end
end

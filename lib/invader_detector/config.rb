module InvaderDetector
  class Config
    attr_accessor :negatives, :positives, :sleep_time, :screen_shift, :outputer

    def initialize
      @negatives = ["-"]
      @positives = %w[o O]
      @sleep_time = 0.3
      @screen_shift = 3
      @outputer = ->(body) { puts body }
    end
  end
end

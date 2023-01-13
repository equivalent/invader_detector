module InvaderDetector
  class RowProbabilityCalculator
    attr_reader :sample_row, :invader_row

    def initialize(sample_row:, invader_row:)
      @sample_row = sample_row
      @invader_row = invader_row
    end

    def call
      return 0 unless sample_positives.any?
      return 100 if sample_row == invader_row

      calculated_probability
    end

    private

    def calculated_probability
      probability = 0
      sample_row.each_with_index do |cell, index|
        next unless cell.positive?

        probability += 1 if cell == invader_row[index]
      end
      (probability.to_f / invader_positives.size * 100).round
    end

    def invader_positives
      invader_row.select(&:positive?)
    end

    def sample_positives
      sample_row.select(&:positive?)
    end
  end
end

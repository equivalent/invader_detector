module InvaderDetector
  class RectangularProbabilityCalculator
    attr_reader :invader_rectangular

    def initialize(invader_rectangular:)
      @invader_rectangular = invader_rectangular
    end

    def call(sample_rectangular)
      probability = 0
      sample_rectangular.each_with_index do |row, row_index|
        probability += row_probablility(row, row_index)
      end
      probability / invader_rectangular.size
    end

    private

    def row_probablility(row, row_index)
      RowProbabilityCalculator.new(
        sample_row: row,
        invader_row: invader_rectangular[row_index]
      ).call
    end
  end
end

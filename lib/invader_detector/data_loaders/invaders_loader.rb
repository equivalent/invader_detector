module InvaderDetector
  class InvadersLoader
    def call
      YAML.load_file("./data/invaders.yml").map do |invader_data|
        load_invader(invader_data)
      end
    end

    private

    def load_invader(invader_data)
      raw_invader = read(invader_data.fetch("file"))
      invader = Invader.parse(raw_invader)
      invader.low_probability_color    = invader_data.fetch("low_probability_color")
      invader.medium_probability_color = invader_data.fetch("medium_probability_color")
      invader.high_probability_color   = invader_data.fetch("high_probability_color")
      invader
    end

    def invaders_folder
      Pathname.new("./data/invaders")
    end

    def parse_invader(raw)
      Invader.parse(raw)
    end

    def read(file_name)
      File.read(invaders_folder + file_name)
    end
  end
end

require "invader_detector"
Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def crab_invader_raw
  InvaderDetector.root.join("data", "invaders/crab_invader.txt").read
end

def squid_invader_raw
  InvaderDetector.root.join("data", "invaders/squid_invader.txt").read
end

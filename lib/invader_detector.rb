require 'pathname'
require "forwardable"
require "yaml"
require "colorized_string"

require_relative "invader_detector/version"
require_relative "invader_detector/config"
require_relative "invader_detector/data_loaders/invaders_loader"
require_relative "invader_detector/data_loaders/radar_loader"
require_relative "invader_detector/parser"
require_relative "invader_detector/field_translator"
require_relative "invader_detector/models/field"
require_relative "invader_detector/models/radar_field"
require_relative "invader_detector/models/invader"
require_relative "invader_detector/calculators/rectangular_probability_calculator"
require_relative "invader_detector/calculators/row_probability_calculator"
require_relative "invader_detector/update_field_probability_service"
require_relative "invader_detector/radar_updater"
require_relative "invader_detector/views/radar_field_view"
require_relative "invader_detector/views/radar_view"
require_relative "invader_detector/radar_screen"
require_relative "invader_detector/radar_input"
require_relative "invader_detector/controller"

module InvaderDetector
  class Error < StandardError; end

  def self.config
    @config ||= Config.new
  end

  def self.run
    InvaderDetector::Controller.new.call
  end
end

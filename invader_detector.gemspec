# frozen_string_literal: true

require_relative "lib/invader_detector/version"

Gem::Specification.new do |spec|
  spec.name = "invader_detector"
  spec.version = InvaderDetector::VERSION
  spec.authors = ["Tomas Valent"]
  spec.email = ["equivalent@eq8.eu"]

  spec.summary = "Detect ASCII invaders in a matrix of characters."
  spec.description = "Gem is used to detect fictional ASCII enemies in a matrix of characters."
  spec.homepage = "https://github.com/equivalent/invader_detector"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/equivalent/invader_detector"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.8.1"
end

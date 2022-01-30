# frozen_string_literal: true

require_relative "lib/rssbridge/bridge/amiami/version"

Gem::Specification.new do |spec|
  spec.name = "rssbridge-bridge-amiami"
  spec.version = Rssbridge::Bridge::Amiami::VERSION
  spec.authors = ["Michał Zając"]
  spec.email = ["michal.zajac@gmail.com"]

  spec.summary = "rite a short summary, because RubyGems requires one."
  spec.description = "Write a longer description or delete this line."
  spec.homepage = "https://something.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://something.com"
  spec.metadata["changelog_uri"] = "https://something.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "zeitwerk", "~> 2.5.4"
  spec.add_dependency "nokogiri", "~> 1.13.1"
  spec.add_dependency "ferrum", "~> 0.11"
  spec.add_dependency "tty-logger", "~> 0.6.0"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.21"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
end

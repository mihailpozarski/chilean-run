# frozen_string_literal: true

require_relative "lib/chilean/rutify/version"

Gem::Specification.new do |spec|
  spec.name          = "chilean-rutify"
  spec.version       = Chilean::Rutify::VERSION
  spec.authors       = ["Mihail Pozarski"]
  spec.email         = ["mihailpozarski@outlook.com"]

  spec.summary       = "Rails chilean rut validator formater"
  spec.description   = "A useful chilean rut validator and formater for Rails"
  spec.homepage      = "https://github.com/mihailpozarski/chilean-rutify"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mihailpozarski/chilean-rutify"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activerecord", "~> 6.0"
  spec.add_development_dependency "activesupport", "~> 6.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "rubocop", "~> 1.0"
  spec.add_development_dependency "rubocop-performance", "~> 1.11.4"
  spec.add_development_dependency "rubocop-rails", "~> 2.11.3"
  spec.add_development_dependency "rubocop-rspec", "~> 2.4.0"
end

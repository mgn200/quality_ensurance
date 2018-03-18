# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "quality_ensurance/version"

Gem::Specification.new do |spec|
  spec.name          = "quality_ensurance"
  spec.version       = QualityEnsurance::VERSION
  spec.authors       = ["Paul Fear"]
  spec.email         = ["levelkaksi@gmail.com"]

  spec.summary       = %q{Copies different quality linters and specs to .quality and /spec folders. Runs the specs, that actually
                          invokes linters check.}
  spec.description   = %q{Uses code quality linters(gems), such as: brakeman, bundler-audit, haml_lint,
                          i18n-tasks, reek, rubocop and scss_lint. Contains spec for every of the linters.
                          When specs are run, described linters start to work. If violations are found, specs will fail.
                          If specs pass, then no violations are found.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = 'quality_ensurance'
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "brakeman"
  spec.add_runtime_dependency "bundler-audit"
  spec.add_runtime_dependency "haml_lint"
  spec.add_runtime_dependency "i18n-tasks"
  spec.add_runtime_dependency "reek"
  spec.add_runtime_dependency "rubocop"
  spec.add_runtime_dependency "scss-lint"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"
end

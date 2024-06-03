# frozen_string_literal: true

require_relative "lib/rust_uuid/version"

Gem::Specification.new do |spec|
  spec.name = "rust_uuid"
  spec.version = RustUUID::VERSION
  spec.authors = ["MATSUMOTO, Katsuyoshi"]
  spec.email = ["github@katsyoshi.org"]

  spec.summary = "Generate UUID using rust"
  spec.description = "Generate UUID using rust"
  spec.homepage = "https://github.com/katsyoshi/rust_uuid"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage

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
  spec.extensions = ["ext/rust_uuid/Cargo.toml"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "benchmark-ips"
  spec.add_development_dependency "rake", ">= 13.0.0"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rb_sys"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "steep"
  spec.add_development_dependency "uuid7"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# frozen_string_literal: true

require_relative 'lib/valimeter/version'

Gem::Specification.new do |spec|
  spec.name = 'valimeter'
  spec.version = Valimeter::VERSION
  spec.authors = ['Nujian Den Mark Meralpis']
  spec.email = ['meralpisdenmark@gmail.com']

  spec.summary = 'A ruby-on-rails plugin for validating ActionController parameters.'
  spec.description = 'A structured model for validating ActionController parameters.'
  spec.homepage = 'https://github.com/denmarkmeralpis/valimeter'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  # spec.metadata['allowed_push_host'] = "Set to your gem server 'https://rubygems.org'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/denmarkmeralpis/valimeter'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split('\x0').reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'activesupport', '>= 4.0'
  # spec.add_development_dependency 'byebug'

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency 'example-gem', '~> 1.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

# frozen_string_literal: true

require_relative 'lib/module_methods/version'

Gem::Specification.new do |spec|
	spec.name        = 'module_methods'
	spec.version     = ModuleMethods::VERSION
	spec.authors     = ['Alexander Popov']
	spec.email       = ['alex.wayfer@gmail.com']

	spec.summary =
		'Extendable module for modules with instance and class methods.'
	spec.description = <<~DESC
		Extendable module for modules with instance and class methods.
		These modules can be included into each other modules and saving all chain,
		including `inherited` or `included` (class) methods.
	DESC
	spec.license = 'MIT'

	spec.required_ruby_version = '>= 2.7', '< 4'

	github_uri = 'https://github.com/AlexWayfer/module_methods'

	spec.homepage = github_uri

	spec.metadata = {
		'bug_tracker_uri' => "#{github_uri}/issues",
		'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
		'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
		'homepage_uri' => spec.homepage,
		'rubygems_mfa_required' => 'true',
		'source_code_uri' => github_uri
	}

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.add_development_dependency 'activesupport', '~> 7.0'
	spec.add_development_dependency 'bundler', '~> 2.0'
	spec.add_development_dependency 'pry-byebug', '~> 3.9'

	spec.add_development_dependency 'codecov', '~> 0.6.0'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'simplecov', '~> 0.21.2'

	spec.add_development_dependency 'rubocop', '~> 1.30.0'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 2.0'

	spec.add_development_dependency 'gem_toys', '~> 0.12.1'
	spec.add_development_dependency 'toys', '~> 0.13.0'
end

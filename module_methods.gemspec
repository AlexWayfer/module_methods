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

	spec.required_ruby_version = '>= 2.5'

	source_code_uri = 'https://github.com/AlexWayfer/module_methods'

	spec.homepage = source_code_uri

	spec.metadata['source_code_uri'] = source_code_uri

	spec.metadata['homepage_uri'] = spec.homepage

	spec.metadata['changelog_uri'] =
		'https://github.com/AlexWayfer/module_methods/blob/master/CHANGELOG.md'

	spec.files = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt', 'CHANGELOG.md']

	spec.add_development_dependency 'activesupport', '~> 6.0'
	spec.add_development_dependency 'codecov', '~> 0.1.0'
	spec.add_development_dependency 'pry-byebug', '~> 3.9'
	spec.add_development_dependency 'rake', '~> 13.0'
	spec.add_development_dependency 'rspec', '~> 3.9'
	spec.add_development_dependency 'rubocop', '~> 0.86.0'
	spec.add_development_dependency 'rubocop-performance', '~> 1.0'
	spec.add_development_dependency 'rubocop-rspec', '~> 1.0'
	spec.add_development_dependency 'simplecov', '~> 0.18.0'
end

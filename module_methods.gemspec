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

	spec.required_ruby_version = '>= 3.0', '< 4'

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
end

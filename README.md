# Module Methods

![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/AlexWayfer/module_methods?style=flat-square)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/module_methods/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/module_methods)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/AlexWayfer/module_methods.svg?style=flat-square)](https://codeclimate.com/github/AlexWayfer/module_methods)
![Depfu](https://img.shields.io/depfu/AlexWayfer/module_methods?style=flat-square)
[![Inline docs](https://inch-ci.org/github/AlexWayfer/module_methods.svg?branch=master)](https://inch-ci.org/github/AlexWayfer/module_methods)
[![license](https://img.shields.io/github/license/AlexWayfer/module_methods.svg?style=flat-square)](https://github.com/AlexWayfer/module_methods/blob/master/LICENSE)
[![Gem](https://img.shields.io/gem/v/module_methods.svg?style=flat-square)](https://rubygems.org/gems/module_methods)

Extendable module for modules with instance and class methods.
These modules can be included into each other modules and saving all chain,
including `inherited` or `included` (class) methods.

There are no conflicts with `ActiveSupport::Concern`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'module_methods'
```

And then execute:

```shell
bundle install
```

Or install it yourself as:

```shell
gem install module_methods
```

## Usage

```ruby
require 'module_methods'

module SomeCommonCode
  extend ::ModuleMethods::Extension

  module ClassMethods
    def inherited(klass)
      ## manipulations with klass
    end
  end

  def some_method
    ## this is instance method
  end
end

module MoreSpecificCommonCode
  include SomeCommonCode

  module ClassMethods
    def inherited(klass)
      ## you can control the order of `inherited` execution by `super`
      ## this `super` executes `inherited` in `SomeCommonCode`
      super
    end
  end

  def some_another_method
    ## This is another instance method.
  end
end

class BaseClass
  include MoreSpecificCommonCode

  ## Instance methods from modules are here.
end

class EndPoint < BaseClass
  ## Both `inherited` from `SomeCommonCode` and `MoreSpecificCommonCode`
  ## are executing here; private methods from modules are also here.
end
```

## Development

After checking out the repo, run `bundle install` to install dependencies.
Then, run `bundle exec rake spec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/AlexWayfer/module_methods).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

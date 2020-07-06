# frozen_string_literal: true

module ModuleMethods
	## Module for module methods, because this module can be included
	## into other modules before including into classes.
	module Extension
		## Getter for saving the whole chain of including and extending (nested `ClassMethods`)
		def modules_with_class_methods
			@modules_with_class_methods ||= [self]
		end

		## Main logic, which will be applied after extending with this module
		## @param base [Module, Class, nil] a module or a class in which extended module
		##   will be included
		## @yield a block just will be passed to the `super`;
		##   it's for `ActiveSupport::Concern` compatibility
		def included(base = nil, &block)
			super

			return unless base

			if base.instance_of? Module
				base.extend ::ModuleMethods::Extension
				base.modules_with_class_methods.unshift(*modules_with_class_methods)
			end

			modules_with_class_methods.each do |module_with_class_methods|
				next unless module_with_class_methods.const_defined?(:ClassMethods, false)

				base.extend module_with_class_methods::ClassMethods
			end
		end
	end
end

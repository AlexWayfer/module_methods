# frozen_string_literal: true

module ModuleMethods
	## Module for module methods, because this module can be included
	## into other modules before including into controllers.
	module Extension
		def modules_with_class_methods
			@modules_with_class_methods ||= [self]
		end

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

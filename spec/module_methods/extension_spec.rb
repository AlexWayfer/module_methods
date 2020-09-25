# frozen_string_literal: true

describe ModuleMethods::Extension do
	## I don't know why, but `stub_const` and `let` don't work correctly
	# rubocop:disable RSpec/LeakyConstantDeclaration
	# rubocop:disable Lint/ConstantDefinitionInBlock
	module SomeCommonCode
		extend ::ModuleMethods::Extension

		module ClassMethods
			def inherited(klass)
				super
				klass.some_variable *= 3
			end

			def some_common_class_method
				'This class method from SomeCommonCode'
			end
		end

		def some_common_instance_method
			'This instance method from SomeCommonCode'
		end
	end

	module MoreSpecificCommonCode
		include SomeCommonCode

		module ClassMethods
			def inherited(klass)
				klass.some_variable = 2
				super
			end

			def some_specific_class_method
				'This class method from MoreSpecificCommonCode'
			end
		end

		def some_specific_instance_method
			'This instance method from MoreSpecificCommonCode'
		end
	end

	module CustomCodeBeforeASModule
		extend ::ModuleMethods::Extension

		module ClassMethods
			def some_custom_class_method_before_as_module
				'This class method from CustomCodeBeforeASModule'
			end
		end

		def some_custom_instance_method_before_as_module
			'This instance method from CustomCodeBeforeASModule'
		end
	end

	module ASModule
		extend ActiveSupport::Concern
		extend ::ModuleMethods::Extension

		included do
			def method_from_as_module
				'This instance method from ASModule'
			end
		end
	end

	module AnotherASModule
		extend ActiveSupport::Concern
		include ASModule
		include CustomCodeBeforeASModule

		class_methods do
			def class_method_from_as_module
				'This class method from AnotherASModule'
			end
		end
	end

	class BaseClass
		include MoreSpecificCommonCode
		include AnotherASModule

		class << self
			attr_accessor :some_variable
		end
	end

	class EndPoint < BaseClass
	end
	# rubocop:enable RSpec/LeakyConstantDeclaration
	# rubocop:enable Lint/ConstantDefinitionInBlock

	describe EndPoint do
		subject { described_class }

		describe '.some_variable' do
			subject { super().some_variable }

			it { is_expected.to eq 6 }
		end

		describe '.some_common_class_method' do
			subject { super().some_common_class_method }

			it { is_expected.to eq 'This class method from SomeCommonCode' }
		end

		describe '.some_specific_class_method' do
			subject { super().some_specific_class_method }

			it { is_expected.to eq 'This class method from MoreSpecificCommonCode' }
		end

		describe '.class_method_from_as_module' do
			subject { super().class_method_from_as_module }

			it { is_expected.to eq 'This class method from AnotherASModule' }
		end

		describe '.some_custom_class_method_before_as_module' do
			subject { super().some_custom_class_method_before_as_module }

			it { is_expected.to eq 'This class method from CustomCodeBeforeASModule' }
		end

		describe 'instace' do
			subject { super().new }

			describe '#some_common_instance_method' do
				subject { super().some_common_instance_method }

				it { is_expected.to eq 'This instance method from SomeCommonCode' }
			end

			describe '#some_specific_instance_method' do
				subject { super().some_specific_instance_method }

				it { is_expected.to eq 'This instance method from MoreSpecificCommonCode' }
			end

			describe '#method_from_as_module' do
				subject { super().method_from_as_module }

				it { is_expected.to eq 'This instance method from ASModule' }
			end

			describe '#some_custom_instance_method_before_as_module' do
				subject { super().some_custom_instance_method_before_as_module }

				it { is_expected.to eq 'This instance method from CustomCodeBeforeASModule' }
			end
		end
	end
end

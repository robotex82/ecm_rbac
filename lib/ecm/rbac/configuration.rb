require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Ecm
  module Rbac
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:user_class_name) { 'User' }

      def self.user_class
        user_class_name.constantize
      end
    end
  end
end
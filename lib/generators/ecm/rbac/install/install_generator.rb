module Ecm
  module Rbac
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the intializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_initializer
          copy_file 'initializer.rb', 'config/initializers/ecm_rbac.rb'
        end
      end
    end
  end
end
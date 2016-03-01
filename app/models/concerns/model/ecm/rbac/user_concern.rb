module Model
  module Ecm
    module Rbac
      module UserConcern
        extend ActiveSupport::Concern

        included do
          # associations
          has_many :user_roles, class_name: 'Ecm::Rbac::UserRole'
          has_many :roles, class_name: 'Ecm::Rbac::Role', through: :user_roles
          has_many :role_permissions, class_name: 'Ecm::Rbac::RolePermission', through: :roles
          has_many :permissions, through: :role_permissions, class_name: 'Ecm::Rbac::Permission'

          has_many :enabled_roles, -> { enabled }, class_name: 'Ecm::Rbac::Role', through: :user_roles # , source: :user
          has_many :enabled_role_permissions, class_name: 'Ecm::Rbac::RolePermission', through: :enabled_roles, source: :user_roles
          
          has_many :enabled_permissions, through: :enabled_role_permissions, class_name: 'Ecm::Rbac::Permission', source: :permission
        end

        def allowed_to?(permission_name)
          enabled_permissions.map(&:identifier).map(&:to_sym).include?(permission_name.to_sym)
        end
      end
    end
  end
end

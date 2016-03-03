module Ecm::Rbac
  class UserRole < ActiveRecord::Base
    # associations
    belongs_to :user, class_name: Ecm::Rbac::Configuration.user_class, foreign_key: 'user_id', inverse_of: :user_roles
    # belongs_to :enabled_user, foreign_key: 'user_id', class_name: 'User'
    belongs_to :role, inverse_of: :user_roles

    belongs_to :enabled_role, -> { enabled }, foreign_key: 'role_id', class_name: 'Ecm::Rbac::Role'
    has_many :enabled_role_permissions, through: :enabled_role, source: :user_roles, class_name: 'Ecm::Rbac::RolePermission'
    has_many :enabled_permissions, through: :enabled_role_permissions, class_name: 'Ecm::Rbac::Permission', source: :permission

    # validations
    validates :user, presence: true
    validates :user_id, uniqueness: { scope: :role_id }
    validates :role, presence: true
  end
end

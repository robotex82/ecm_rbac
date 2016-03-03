class CreateEcmRbacRolePermissions < ActiveRecord::Migration
  def change
    create_table :ecm_rbac_role_permissions do |t|
      t.integer :role_id, index: true
      t.integer :permission_id, index: true

      t.timestamps null: false
    end
  end
end

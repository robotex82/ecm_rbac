class CreateEcmRbacUserRoles < ActiveRecord::Migration
  def change
    create_table :ecm_rbac_user_roles do |t|
      t.integer :user_id, index: true
      t.integer :role_id, index: true

      t.timestamps null: false
    end
  end
end

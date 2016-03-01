class CreateEcmRbacUserRoles < ActiveRecord::Migration
  def change
    create_table :ecm_rbac_user_roles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

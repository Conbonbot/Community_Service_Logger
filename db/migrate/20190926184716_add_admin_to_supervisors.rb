class AddAdminToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :admin, :boolean
  end
end

class DropTableForSupervisors < ActiveRecord::Migration[5.1]
  def change
    remove_column :supervisors, :access_code
  end
end

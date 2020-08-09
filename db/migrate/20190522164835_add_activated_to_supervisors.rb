class AddActivatedToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :actived, :boolean
  end
end

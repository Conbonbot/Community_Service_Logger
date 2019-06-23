class AddAccessCodeToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :access_code, :bigint
  end
end

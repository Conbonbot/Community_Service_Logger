class AddAddressToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :address, :string
  end
end

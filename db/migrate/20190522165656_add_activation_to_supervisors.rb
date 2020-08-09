class AddActivationToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :activation_digest, :string
    add_column :supervisors, :activated, :boolean, default: false
    add_column :supervisors, :activated_at, :datetime
  end
end

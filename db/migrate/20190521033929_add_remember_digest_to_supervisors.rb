class AddRememberDigestToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :remember_digest, :string
  end
end

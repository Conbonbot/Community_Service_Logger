class AddPasswordDigestToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :password_digest, :string
  end
end

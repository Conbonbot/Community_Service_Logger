class AddResetToSupervisors < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :reset_digest, :string
    add_column :supervisors, :reset_sent_at, :datetime
  end
end

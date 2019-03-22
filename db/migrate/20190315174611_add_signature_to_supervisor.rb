class AddSignatureToSupervisor < ActiveRecord::Migration[5.1]
  def change
    add_column :supervisors, :signature, :string
  end
end

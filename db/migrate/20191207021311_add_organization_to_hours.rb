class AddOrganizationToHours < ActiveRecord::Migration[5.1]
  def change
    add_column :hours, :organization, :string
  end
end

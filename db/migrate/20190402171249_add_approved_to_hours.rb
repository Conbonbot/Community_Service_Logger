class AddApprovedToHours < ActiveRecord::Migration[5.1]
  def change
    add_column :hours, :approved, :boolean, default: nil
  end
end

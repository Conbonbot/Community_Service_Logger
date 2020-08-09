class AddCutoffToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cutoff, :datetime
  end
end

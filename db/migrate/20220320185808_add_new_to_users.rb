class AddNewToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :new100, :boolean, default: false
  end
end

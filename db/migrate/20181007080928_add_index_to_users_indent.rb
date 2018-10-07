class AddIndexToUsersIndent < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :indent, unique: true
  end
end

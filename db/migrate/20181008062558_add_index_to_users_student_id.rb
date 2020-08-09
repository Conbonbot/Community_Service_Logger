class AddIndexToUsersStudentId < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :student_id, unique: true
  end
end

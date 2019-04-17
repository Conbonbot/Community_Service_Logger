class AddSupervisorToHours < ActiveRecord::Migration[5.1]
  def change
    add_reference :hours, :supervisor, foreign_key: true
  end
end

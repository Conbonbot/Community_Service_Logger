class CreateSupervisors < ActiveRecord::Migration[5.1]
  def change
    create_table :supervisors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :adress
      t.string :telephone
      t.string :role
      t.string :organization

      t.timestamps
    end
  end
end

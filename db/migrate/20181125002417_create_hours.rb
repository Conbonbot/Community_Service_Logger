class CreateHours < ActiveRecord::Migration[5.1]
  def change
    create_table :hours do |t|
      t.integer :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :hours, [:user_id, :created_at]
  end
end

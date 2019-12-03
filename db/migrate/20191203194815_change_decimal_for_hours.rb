class ChangeDecimalForHours < ActiveRecord::Migration[5.1]
  def change
    change_column :hours, :content, :decimal, precision: 5, scale: 2
  end
end

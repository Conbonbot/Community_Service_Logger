class ChangeDecimalForHoursToAllow1000Hours < ActiveRecord::Migration[6.1]
  def change
    change_column :hours, :content, :decimal, precision: 6, scale: 2
  end
end

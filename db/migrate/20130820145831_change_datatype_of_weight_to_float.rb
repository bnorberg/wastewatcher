class ChangeDatatypeOfWeightToFloat < ActiveRecord::Migration
  def change
    change_column :weighings, :weight, :float
  end
end

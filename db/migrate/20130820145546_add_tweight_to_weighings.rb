class AddTweightToWeighings < ActiveRecord::Migration
  def change
    add_column :weighings, :t_weight, :float
  end
end

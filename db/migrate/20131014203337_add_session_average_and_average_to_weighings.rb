class AddSessionAverageAndAverageToWeighings < ActiveRecord::Migration
  def change
    add_column :weighings, :session_average, :float
    add_column :weighings, :average, :float
  end
end

class AddSessionDurationAverageAndDurationAverageToWeighings < ActiveRecord::Migration
  def change
    add_column :weighings, :session_duration_average, :float
    add_column :weighings, :duration_average, :float
  end
end

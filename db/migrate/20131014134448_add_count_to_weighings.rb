class AddCountToWeighings < ActiveRecord::Migration
  def change
    add_column :weighings, :count, :integer
  end
end

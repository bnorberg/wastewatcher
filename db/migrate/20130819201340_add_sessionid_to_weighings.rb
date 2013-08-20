class AddSessionidToWeighings < ActiveRecord::Migration
  def change
    add_column :weighings, :session_id, :integer
  end
end

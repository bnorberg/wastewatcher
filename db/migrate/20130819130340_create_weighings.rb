class CreateWeighings < ActiveRecord::Migration
  def change
    create_table :weighings do |t|
      t.integer :weight
      t.integer :duration

      t.timestamps
    end
  end
end

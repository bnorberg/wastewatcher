class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :meal
      t.string :location

      t.timestamps
    end
  end
end

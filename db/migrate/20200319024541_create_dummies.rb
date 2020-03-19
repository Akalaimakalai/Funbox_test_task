class CreateDummies < ActiveRecord::Migration[5.2]
  def change
    create_table :dummies do |t|
      t.float :value, null: false
      t.datetime :deadline, null: false

      t.timestamps
    end
  end
end

class CreateExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.string :name, null: false
      t.string :char_code, null: false
      t.float :value

      t.timestamps
    end
  end
end

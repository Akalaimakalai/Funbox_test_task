class AddFakeValueToExchangeRate < ActiveRecord::Migration[5.2]
  def change
    add_column :exchange_rates, :fake_value, :float
  end
end

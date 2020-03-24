class ExchangeRate < ApplicationRecord
  after_update_commit :broadcast_exchange_rate

  validates :name, :char_code, presence: true
  validates :char_code, uniqueness: true
  validates :value, numericality: { greater_than: 0 }, if: :value
  validates :fake_value, numericality: { greater_than: 0 }, if: :fake_value

  private

  def broadcast_exchange_rate
    ActionCable.server.broadcast('exchange_rates',
                                  ApplicationController.render(partial: 'exchange_rates/exchange_rate',
                                                                        locals: { exchange_rate: self })
                                )
  end
end

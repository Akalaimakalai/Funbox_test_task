class ExchangeRate < ApplicationRecord
  validates :name, :char_code, presence: true
  validates :value, numericality: { greater_than: 0 }, if: :value
end

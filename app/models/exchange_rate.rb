class ExchangeRate < ApplicationRecord
  validates :name, :char_code, presence: true
  validates :char_code, uniqueness: true
  validates :value, numericality: { greater_than: 0 }, if: :value
  validates :fake_value, numericality: { greater_than: 0 }, if: :fake_value
end

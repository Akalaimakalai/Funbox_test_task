class ExchangeRate < ApplicationRecord
  validates :name, :char_code, presence: true
  validates :value, numericality: true, if: :value
end

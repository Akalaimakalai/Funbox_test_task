class ExchangeRatesController < ApplicationController

  def index
    @exchange_rates = ExchangeRate.all
  end
end

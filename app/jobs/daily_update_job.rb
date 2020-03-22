class DailyUpdateJob < ApplicationJob
  queue_as :default

  def perform
    @currency = ExchangeRate.find_by(char_code: "USD")
    daily_rate = DailyRateService.call
    @currency.update(value: daily_rate)
  end
end

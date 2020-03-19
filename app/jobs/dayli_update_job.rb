class DayliUpdateJob < ApplicationJob
  queue_as :default

  def perform
    @valute = ExchangeRate.find_by(char_code: "USD")
    daily_rate = DailyRateService.call
    @valute.update!(value: daily_rate)
  end
end

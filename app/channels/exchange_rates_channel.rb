class ExchangeRatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "exchange_rates"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

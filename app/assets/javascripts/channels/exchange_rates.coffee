App.exchange_rates = App.cable.subscriptions.create "ExchangeRatesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log 'Connected!'

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.exchange_rates').replaceWith(data)

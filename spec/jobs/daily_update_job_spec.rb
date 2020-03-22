require 'rails_helper'

RSpec.describe DailyUpdateJob, type: :job do

  let!(:currency) { create(:exchange_rate, char_code: "USD") }

  it 'calls DailyRateService' do
    expect(DailyRateService).to receive(:call)
    DailyUpdateJob.perform_now
  end

  it 'update exchange rate' do
    expect(DailyRateService).to receive(:call).and_return(99.99)
    DailyUpdateJob.perform_now
    currency.reload
    expect(currency.value).to eq 99.99
  end
end

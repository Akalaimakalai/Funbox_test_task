require 'rails_helper'

RSpec.describe DayliUpdateJob, type: :job do

  let!(:valute) { create(:exchange_rate, char_code: "USD") }

  it 'calls DailyRateService' do
    expect(DailyRateService).to receive(:call)
    DayliUpdateJob.perform_now
  end

  it 'update exchange rate' do
    expect(DailyRateService).to receive(:call).and_return(99.99)
    DayliUpdateJob.perform_now
    valute.reload
    expect(valute.value).to eq 99.99
  end
end

require 'rails_helper'

RSpec.describe DieDummyJob, type: :job do
  let!(:valute) { create(:exchange_rate, :usd) }
  let!(:dummy) { create(:dummy) }

  it 'deletes the dummy' do
    expect { DieDummyJob.perform_now(dummy) }.to change(Dummy, :count).by(-1)
  end
end

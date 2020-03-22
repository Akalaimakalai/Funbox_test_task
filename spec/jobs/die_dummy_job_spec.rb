require 'rails_helper'

RSpec.describe DeleteDummyJob, type: :job do
  let!(:currency) { create(:exchange_rate, :usd) }
  let!(:dummy) { create(:dummy) }

  it 'deletes the dummy' do
    expect { DeleteDummyJob.perform_now(dummy) }.to change(Dummy, :count).by(-1)
  end
end

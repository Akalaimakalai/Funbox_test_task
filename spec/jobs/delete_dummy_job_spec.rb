require 'rails_helper'

RSpec.describe DeleteDummyJob, type: :job do
  let!(:currency) { create(:exchange_rate, :usd) }
  let!(:dummy) { create(:dummy) }

  context 'there is the dummy in the database' do
    it 'deletes the dummy' do
      expect { DeleteDummyJob.perform_now(dummy) }.to change(Dummy, :count).by(-1)
    end
  end

  context 'there is NOT the dummy in the database' do
    it 'does not delete the dummy' do
      Dummy.delete_all
      expect(dummy).to_not receive(:destroy)
      DeleteDummyJob.perform_now(dummy)
    end
  end
end

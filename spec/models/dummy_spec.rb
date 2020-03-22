require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it { should validate_presence_of :value }
  it { should validate_presence_of :deadline }
  it { should validate_numericality_of(:value).is_greater_than(0) }

  describe '#validate_deadline_is_valid_time' do

    it 'deadline is valid datetime' do
      expect(Dummy.new(value: 42.00, deadline: 1.hour.from_now)).to be_valid
    end

    it 'deadline is invalid datetime' do
      expect(Dummy.new(value: 42.00, deadline: 1.hour.ago)).to_not be_valid
    end

    it 'deadline is NOT datetime' do
      expect(Dummy.new(value: 42.00, deadline: "aliluya")).to_not be_valid
    end
  end

  describe 'callbacks' do
    let!(:currency_usd) { create(:exchange_rate, :usd) }

    describe 'before_create' do
      let!(:dummys) { create_list(:dummy, 2) }

      it 'does not let create more than one dummy' do
        expect(Dummy.count).to eq 1
      end
    end

    describe 'after_create_commit' do

      it 'sets fake_value for USD' do
        create(:dummy, value: 12.3)
        currency_usd.reload

        expect(currency_usd.fake_value).to_not be_nil
        expect(currency_usd.fake_value).to eq 12.3
      end

      it 'does not set fake_value for other currencys' do
        currency2 = create(:exchange_rate)

        create(:dummy, value: 12.3)
        currency2.reload

        expect(currency2.fake_value).to be_nil
      end

      it 'calls DeleteDummyJob for itself' do
        dummy = build(:dummy)
        expect(DeleteDummyJob).to receive(:set).with(wait_until: dummy.deadline).and_return(DeleteDummyJob)
        expect(DeleteDummyJob).to receive(:perform_later).with(dummy)
        dummy.save
      end
    end

    describe 'after_destroy' do

      it 'sets USD fake_value back to nil' do
        dummy = create(:dummy)

        currency_usd.reload
        expect(currency_usd.fake_value).to eq dummy.value

        dummy.destroy

        currency_usd.reload
        expect(currency_usd.fake_value).to be_nil
      end
    end
  end
end

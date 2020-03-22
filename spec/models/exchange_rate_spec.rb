require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :char_code }

  context 'validate_uniqueness' do
    let!(:currency) { create(:exchange_rate) }
    it { should validate_uniqueness_of(:char_code) }
  end

  describe 'validate_numericality_of(:value)' do
    context "if value = nil" do
      before { allow(subject).to receive(:value).and_return(nil) }
      it { should_not validate_numericality_of(:value).is_greater_than(0) }
    end

    context "if value = something" do
      before { allow(subject).to receive(:value).and_return("NotNill") }
      it { should validate_numericality_of(:value).is_greater_than(0) }
    end
  end

  describe 'validate_numericality_of(:fake_value)' do
    context "if fake_value = nil" do
      before { allow(subject).to receive(:fake_value).and_return(nil) }
      it { should_not validate_numericality_of(:fake_value).is_greater_than(0) }
    end

    context "if fake_value = something" do
      before { allow(subject).to receive(:fake_value).and_return("NotNill") }
      it { should validate_numericality_of(:fake_value).is_greater_than(0) }
    end
  end
end

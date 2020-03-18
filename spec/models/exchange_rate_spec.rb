require 'rails_helper'

RSpec.describe ExchangeRate, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :char_code }

  context "if value = nil" do
    before { allow(subject).to receive(:value).and_return(nil) }
    it { should_not validate_numericality_of(:value) }
  end

  context "if value = something" do
    before { allow(subject).to receive(:value).and_return("NotNill") }
    it { should validate_numericality_of(:value) }
  end
end

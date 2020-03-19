require 'rails_helper'

RSpec.describe DailyRateService do

  context 'loking for daily exchange rate' do

    before do
      expect(DailyRateService).to receive(:open).and_return(File.new("#{Rails.root}/spec/fixtures/page_for_parsing.html"))
      expect(Nokogiri::HTML::Document).to receive(:parse).and_call_original
    end

    it 'opens XML file' do
      DailyRateService.call
    end

    it 'returns correct value' do
      expect(DailyRateService.call).to eq 42.0
    end
  end
end

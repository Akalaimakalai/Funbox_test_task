require 'rails_helper'

RSpec.describe ExchangeRatesController, type: :controller do

  describe 'GET #index' do
    let!(:rates) { create_list(:exchange_rate, 2)}

    before { get :index }

    it 'sets collection of all ExchangeRate into @exchange_rates' do
      expect(assigns(:exchange_rates)).to eq rates
    end

    it 'renders template :index' do
      expect(response).to render_template :index
    end
  end
end

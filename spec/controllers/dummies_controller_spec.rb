require 'rails_helper'

RSpec.describe DummiesController, type: :controller do

  describe 'GET #new' do

    before { get :new }

    it 'creates new instance of Dummy' do
      expect(assigns(:dummy)).to be_a_new(Dummy)
    end

    it 'renders template :new' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do
      let!(:currency) { create(:exchange_rate, :usd) }

      it 'saves dummy' do
        expect { post :create, params: { dummy: attributes_for(:dummy) }, format: :js }.to change(Dummy, :count).by(1)
      end

      it 'renders template :create' do
        post :create, params: { dummy: attributes_for(:dummy) }, format: :js
        expect(response).to render_template :create
      end
    end

    context 'with invalid attributes' do
      it 'does not save dummy' do
        expect { post :create, params: { dummy: attributes_for(:dummy, :invalid) }, format: :js }.to_not change(Dummy, :count)
      end

      it 'renders template :create' do
        post :create, params: { dummy: attributes_for(:dummy, :invalid) }, format: :js
        expect(response).to render_template :create
      end
    end
  end
end

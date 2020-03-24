require 'rails_helper'

feature 'User can immediately see updated Exchange rate ', %q{
  In order to always see actual information
  As an authenticated or unauthenticated user
  I'd like to be able to see new exchange rate immediately after update
}, js: true do

  describe 'Multiple sessions' do
    given!(:currency) { create(:exchange_rate, :usd) }

    scenario "question appears on another user's page" do
      Capybara.using_session('user') do
        visit root_path
        expect(page).to have_content currency.value
      end

      Capybara.using_session('dummy_creating') do
        visit admin_path

        fill_in 'Value', with: 999.99
        select '2025', from: "dummy_deadline_1i"

        click_on 'Create'
      end

      Capybara.using_session('user') do
        expect(page).to have_content 999.99
        expect(page).to_not have_content currency.value
      end
    end
  end
end

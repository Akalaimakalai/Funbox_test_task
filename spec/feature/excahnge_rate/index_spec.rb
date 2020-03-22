require 'rails_helper'

feature 'Guest can see exchange rate of USD', %q{
  In order to see exchange rate of currency
  As an authenticated or unauthenticated user
  I'd like to be able to see the list of currencies
} do
  given!(:currency) { create(:exchange_rate) }

  scenario 'guest visit root page' do
    visit root_path

    expect(page).to have_content currency.name
    expect(page).to have_content currency.char_code
    expect(page).to have_content currency.value
  end
end

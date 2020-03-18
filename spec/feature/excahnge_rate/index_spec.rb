require 'rails_helper'

feature 'Guest can see exchange rate of USD', %q{
  In order to see exchange rate of valute
  As an authenticated or unauthenticated user
  I'd like to be able to see the list of valutes
} do
  given!(:valute) { create(:exchange_rate) }

  scenario 'guest visit root page' do
    visit root_path

    expect(page).to have_content valute.name
    expect(page).to have_content valute.char_code
    expect(page).to have_content valute.value
  end
end

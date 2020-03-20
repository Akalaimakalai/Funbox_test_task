require 'rails_helper'

feature 'Guest can create fake exchange rate for USD', %q{
  In order to destroy world economy
  As an authenticated or unauthenticated user
  I'd like to be able to create fake exchange rate
}, js: true do

  given!(:valute) { create(:exchange_rate, :usd) }

  describe 'User creates dummy' do

    scenario 'with valid params' do
      visit admin_path

      fill_in 'Value', with: 999.99
      select '2025', from: "dummy_deadline_1i"

      click_on 'Create'

      visit root_path

      expect(page).to have_content valute.name
      expect(page).to have_content valute.char_code
      expect(page).to_not have_content valute.value
      expect(page).to have_content 999.99
    end

    scenario 'with invalid params' do
      visit admin_path

      click_on 'Create'

      expect(page).to have_content("Value can't be blank")
      expect(page).to have_content("Value is not a number")
      expect(page).to have_content("Deadline must be a valid datetime")
    end
  end
end

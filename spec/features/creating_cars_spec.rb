require 'rails_helper'

feature 'Creating Cars' do
  scenario 'can create a car' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'
# save_and_open_page
    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
  end
end

  # scenario 'Display cars' do
  #   visit '/'
  #
  #   click_link 'New Car'
  #
  #   fill_in 'Make',  with: 'Ford'
  #   fill_in 'Model', with: 'Mustang'
  #   fill_in 'Year',  with: '1967'
  #   fill_in 'Price', with: '2300'
  #
  #   click_button 'Create Car'
  #
  #   expect(page).to have_content('Ford')
  #   expect(page).to have_content('Mustang')
  #   expect(page).to have_content('1967')
  #   expect(page).to have_content('2300')

      # click_button 'Back'
      # click_button 'Edit'
  # end

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

  scenario 'Display cars' do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1968'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    within("#car_table") do
      expect(page).to have_content("Ford")
      expect(page).to have_content("Mustang")
      expect(page).to have_content("1968")
      expect(page).to have_content("$2,300")
    end
  end

  feature 'Creating second car' do
    scenario 'Can create second cars' do
      visit '/'

      click_link 'New Car'

      fill_in 'Make', with: 'Toyota'
      fill_in 'Model', with: 'Camry'
      fill_in 'Year', with: '2015 '
      fill_in 'Price', with: '15000'

      click_button 'Create Car'

      within("#car_table") do
        expect(page).to have_content('Toyota')
        expect(page).to have_content('Camry')
        expect(page).to have_content('2015')
        expect(page).to have_content('$15,000')
      end

      click_link 'New Car'

      fill_in 'Make', with: 'Honda'
      fill_in 'Model', with: 'Accord'
      fill_in 'Year', with: '2012'
      fill_in 'Price', with: '12000'

      click_button 'Create Car'

      within("#car_table") do
        expect(page).to have_content('Honda')
        expect(page).to have_content('Accord')
        expect(page).to have_content('2012')
        expect(page).to have_content('$12,000')
      end
    end

    feature 'Editing car' do
      scenario 'Edits car information (year)' do
        visit '/'

        click_link 'New Car'

        fill_in 'Make', with: 'Honda'
        fill_in 'Model', with: 'Accord'
        fill_in 'Year', with: '2012'
        fill_in 'Price', with: '12000'

        click_button 'Create Car'

        within("#car_table") do
          expect(page).to have_content('Honda')
          expect(page).to have_content('Accord')
          expect(page).to have_content('2012')
          expect(page).to have_content('$12,000')
        end

        click_link 'Edit'

        fill_in 'Make', with: 'Honda'
        fill_in 'Model', with: 'Accord'
        fill_in 'Year', with: '2012'
        fill_in 'Price', with: '12000'

        fill_in 'Year', with: '2011'
        click_button 'Update'

        within("#car_table") do
          expect(page).to have_content('Honda')
          expect(page).to have_content('Accord')
          expect(page).to have_content('2011')
          expect(page).to have_content('$12,000')
        end
      end
    end
  end
end

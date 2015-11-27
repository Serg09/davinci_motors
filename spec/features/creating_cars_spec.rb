require 'spec_helper'

feature "Creating Cars" do
  scenario "can create a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
  end

  scenario "can create a second car" do
    # car.create(...)
    # raise ActiveRecord::RecordInvalid unless car.valid?
    Car.create!(make: 'Ford', model: 'Mustang', year: '1955', price: 99_000)

    visit '/'
    click_link 'New Car'

    fill_in 'Make', with: 'Pontiac'
    fill_in 'Model', with: 'Grand Prix'
    fill_in 'Year', with: '1997'
    fill_in 'Price', with: '23.00'

    click_button 'Create Car'

    expect(page).to have_content('1997 Pontiac Grand Prix created')

    expect(page).to have_selector('table tbody tr', :count => 2)
  end

  scenario "can edit an existing car" do
    car = Car.create!(make: 'Ford', model: 'Mustang', year: '1955', price: 99_000)

    visit '/'

    # within("car_table") do
      click_link 'Edit'
    # end

    fill_in 'Price', with: '9000'
    click_button 'Update Car'

    expect(page).to have_content('1955 Ford Mustang updated')
    # expect(page).to have_selector("table tr td", text: '$9,000.00')
  end

  scenario "can delete an existing car" do
    car = Car.create!(make: 'Ford', model: 'Mustang', year: '1955', price: 99_000)

    visit '/'

    # within("#car_#{car.id}") do
      click_link 'Destroy car'
    # end

    expect(page).to have_content('1955 Ford Mustang deleted')
    expect(page).to_not have_selector("#car_#{car.id}")
  end
end

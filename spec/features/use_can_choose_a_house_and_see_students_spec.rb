require 'rails_helper'

describe "As a user" do
  it "can choose a house and see a list of students for that house" do
    # When I visit "/"
    visit '/'
    # And I select "Slytherin" from the dropdown
    select 'Slytherin', from: :house
    # And I click on "Get Students"
    click_button 'Get Students'
    # Then my path should be "/search" with "house=slytherin" in the parameters
    expect(current_path).to eq(search_path)
    # expect(current_path).to eq('/search?house=slytherin')
    # And I should see a message "22 Students"
    expect(page).to have_content('22 Students')
    # And I should see a list of the 22 members of Slytherin
    expect(page).to have_css('.result', count: 22)
    # And I should see a name and id for each student.
    within(first('.result')) do
      expect(page).to have_content('Student Name: ')
      expect(page).to have_content('Student ID: ')
    end
  end
end

# `http://hogwarts-it.herokuapp.com`
# Your key is: alohamora

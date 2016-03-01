# frozen_string_literal: true

# Feature: Send contacts
#   As a user or visitor
#   I want to send contacts data
feature 'Send contacts', :devise do
  EMAIL = 'test@example.com'.freeze
  PASSWORD = 'please123'.freeze
  NAME = 'test'.freeze

  background do
    FactoryGirl.create :user, email: EMAIL, password: PASSWORD, name: NAME
  end

  # Scenario: User was logged and form contains his name, email
  #   Given I exist as a user
  #   And I am signed in
  #   When I signed in
  #   Then i see my name and email in form already filled
  scenario 'user view filled form data when he is logged in' do
    signin EMAIL, PASSWORD

    expect(page).to have_field('Email', with: EMAIL)
    expect(page).to have_field('Name', with: NAME)
    expect(find_field('Message').value).to be_blank
  end

  # Scenario: User was not logged and form is empty
  #   Given I exist as a user
  #   And I am signed in
  #   When I visit root page
  #   Then I see contacts form
  scenario 'visitor view empty form when he is not logged in' do
    visit '/'

    expect(find_field('Name').value).to be_blank
    expect(find_field('Email').value).to be_blank
    expect(find_field('Message').value).to be_blank
  end

  # Scenario: User or visitor sends invalid contact data
  #   Given I exist as a visitor
  #   When I visit root page
  #   And send invalid contacts data
  #   Then I see errors
  scenario 'visitor sends invalid contact data and see errors' do
    visit '/'

    click_button 'Submit'

    expect(page).to have_css('div .has-error')
    expect(page).to have_content("can't be blank")
  end

  # Scenario: User or visitor sends valid contact data
  #   Given I exist as a visitor
  #   When I visit root page
  #   And send valid contacts data
  #   Then I see alert on success
  scenario 'visitor sends valid contact data and see success alert' do
    visit '/'

    fill_in 'Email', with: EMAIL
    fill_in 'Name', with: NAME

    click_button 'Submit'

    expect(page).to have_css('div .alert-success')
    expect(page).to have_content('Your contacts was sent by email')
  end
end

# frozen_string_literal: true

# Feature: Send contacts
#   As a user or visitor
#   I want to send contacts data
feature 'Send contacts', :devise do
  EMAIL = 'test@example.com'.freeze
  PASSWORD = 'please123'.freeze
  NAME = 'test'.freeze

  background do
    FactoryGirl.create :user
  end

  # Scenario: User was logged and form contains his name, email
  #   Given I exist as a user
  #   And I am signed in
  #   When I signed in
  #   Then i see my name and email in form already filled
  scenario 'user view filled form data when he is logged in' do
    signin EMAIL, PASSWORD

    expect(page).to have_field('email', type: :email, with: EMAIL)
    expect(page).to have_field('name', type: :text, with: NAME)
    expect(page).to have_field('message', type: :textearea, with: nil)
  end

  # Scenario: User was not logged and form is empty
  #   Given I exist as a user
  #   And I am signed in
  #   When I visit root page
  #   Then I see contacts form
  scenario 'visitor view empty form when he is not logged in' do
    visit '/'

    expect(page).to have_field('email', type: :email, with: nil)
    expect(page).to have_field('name', type: :text, with: nil)
    expect(page).to have_field('message', type: :textearea, with: nil)
  end

  # Scenario: User or visitor sends contact data
  #   Given I exist as a visitor
  #   When I visit root page
  #   And send contacts data
  #   Then I see alert on success
  scenario 'visitor sends contact data and see success alert' do
    visit '/'

    fill_in 'Email', with: EMAIL
    fill_in 'Name', with: NAME

    click_button 'Submit'

    expect(page).to have_css('div .alert-success')
    expect(page).to have_content('Your contacts was sent by Email')
  end
end

require 'rails_helper'

feature 'User creates new Event' do
  scenario "creating a new Event with description's length < 10" do
    User.create(username: 'testing_user')
    visit sign_in_path
    fill_in 'username', with: 'testing_user'
    click_button 'button'

    visit new_event_path
    fill_in 'event[description]', with: 'event'
    click_button 'commit'
    expect(page).to have_text 'Add a new Event'
  end

  scenario "creating a new Event with description's length > 10" do
    User.create(username: 'testing_user2')
    visit sign_in_path
    fill_in 'username', with: 'testing_user2'
    click_button 'button'

    visit new_event_path
    fill_in 'event[description]', with: 'Event description'
    fill_in 'event[event_date]', with: Time.now
    click_button 'commit'
    expect(page).to have_text 'Event description'
  end
end

feature 'User creates new Invitation' do
  scenario 'creating a new Invitation' do
    user = User.create(username: 'testing_user3')
    visit sign_in_path
    fill_in 'username', with: 'testing_user3'
    click_button 'button'
    visit new_event_path
    fill_in 'event[description]', with: 'Event description'
    fill_in 'event[event_date]', with: Time.new(2021, 10, 31, 2, 2, 2, '+02:00')
    click_button 'commit'
    visit user_path(user)
    click_button 'commit'
    expect(page).to have_text 'Invitation succesfully has been sent'
  end
end
feature 'User receives new Invitation' do
  scenario 'receiving a new Invitation' do
    user = User.create(username: 'testing_user4')
    user2 = User.create(username: 'testing_user5')
    visit sign_in_path
    fill_in 'username', with: 'testing_user4'
    click_button 'button'
    visit new_event_path
    fill_in 'event[description]', with: 'Event description 4'
    fill_in 'event[event_date]', with: Time.new(2022, 10, 31, 2, 2, 2, '+02:00')
    click_button 'commit'
    visit user_path(user)
    select 'testing_user5', from: 'attendee_id'
    click_button 'commit'
    visit sign_in_path
    fill_in 'username', with: 'testing_user5'
    click_button 'button'
    visit user_path(user2)
    expect(page).to have_text 'Event description 4'
  end
end

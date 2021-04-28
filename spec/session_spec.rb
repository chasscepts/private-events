require 'rails_helper'

feature 'User sign in' do
  scenario 'existing user signs in' do
    User.create(username: 'ilie_babcenco')
    visit sign_in_path
    fill_in 'username', with: 'ilie_babcenco'
    click_button 'button'
    expect(page).to have_text 'Hello Ilie_babcenco'
  end

  scenario 'unexisting user signs in' do
    visit sign_in_path
    fill_in 'username', with: 'ilie_babcenco'
    click_button 'button'
    expect(page).to have_text 'Please check your username'
  end
end

feature 'User sign up' do
  scenario 'sign up with existing username' do
    User.create(username: 'ilie_babcenco')
    visit new_user_path
    fill_in 'user[username]', with: 'ilie_babcenco'
    click_button 'commit'
    expect(page).to have_text 'Username has already been taken'
  end

  scenario 'sign up with wrong length of username' do
    visit new_user_path
    fill_in 'user[username]', with: 'i'
    click_button 'commit'
    expect(page).to have_text 'Username is too short (minimum is 3 characters)'
  end

  scenario 'sign up with with correct username' do
    visit new_user_path
    fill_in 'user[username]', with: 'ilie_babcenco'
    click_button 'commit'
    expect(page).to have_text 'Hello Ilie_babcenco'
  end
end

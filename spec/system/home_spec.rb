require 'rails_helper'

RSpec.describe 'Welcome page', type: :system do
  it 'displays the app title' do
    visit unauthenticated_root_path
    expect(page).to have_content('ezPay')
  end

  it 'displays the login button' do
    visit unauthenticated_root_path
    expect(page).to have_button('Log in')
  end

  it 'provides a link to the signup page' do
    visit unauthenticated_root_path
    expect(page).to have_link('Sign Up', href: new_user_registration_path)
  end

  it 'navigates to the login page when login button is clicked' do
    visit unauthenticated_root_path
    click_button 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'navigates to the signup page when signup link is clicked' do
    visit unauthenticated_root_path
    click_link 'Sign Up'
    expect(page).to have_current_path(new_user_registration_path)
  end

  it 'redirects to the dashboard after successful login' do
    user = create(:user) # Assuming you have a User model and a user factory
    login_as(user, scope: :user)

    visit unauthenticated_root_path
    expect(page).to have_current_path(dashboard_path)
  end

  it 'displays a welcome message for authenticated users' do
    user = create(:user) # Assuming you have a User model and a user factory
    login_as(user, scope: :user)

    visit unauthenticated_root_path
    expect(page).to have_content("Welcome, #{user.username}!")
  end

  it 'handles invalid login attempts gracefully' do
    visit unauthenticated_root_path
    click_button 'Log in'
    expect(page).to have_content('Invalid email or password')
  end
end

require 'rails_helper'

RSpec.describe 'Welcome page', type: :system do
  it 'can see the app title' do
    visit unauthenticated_root_path
    expect(page).to have_content('ezPay')
  end

  it 'can see the login button' do
    visit unauthenticated_root_path
    expect(page).to have_content('Log in')
  end

  it 'can see the signup link' do
    visit unauthenticated_root_path
    expect(page).to have_content('Sign Up')
  end
end

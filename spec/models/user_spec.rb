require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.first
    @user ||= User.create(name: 'Fatema', email: 'fatemanazari78@gmail.com', password: 'Monis_7813')
  end

  it 'User should be valid with a name' do
    expect(@user).to be_valid
  end

  it 'User name cannot be empty' do
    @user.name = ''
    expect(@user).to_not be_valid
  end
end

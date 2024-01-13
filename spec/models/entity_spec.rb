require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:all) do
    @user = User.first
    @user ||= User.create(name: 'Fatema', email: 'fatemanazari78@gmail.com', password: 'Monis_7813')

    @group = Group.first
    @group ||= Group.create(name: 'Grouptest', icon: 'grouptesicon', author: @user)

    # Ensure the group is associated with the user
    @user.update(group: @group) unless @user.group.present?

    @entity = Entity.first
    @entity ||= Entity.create(name: 'Entitytest', amount: 10, group: @group, author: @user)
  end

  it 'Entity should be valid with a name, amount, group, and author' do
    expect(@entity).to be_valid
  end

  it 'Entity name cannot be empty' do
    @entity.name = ''
    expect(@entity).to_not be_valid
  end

  it 'Entity amount should be greater than or equal to 1' do
    @entity.amount = 0
    expect(@entity).to_not be_valid
  end

  # Add a test to ensure the entity is associated with a group
  it 'Entity should belong to a group' do
    @entity.group = nil
    expect(@entity).to_not be_valid
  end

  # Add a test to ensure the entity is associated with an author (user)
  it 'Entity should have an author (user)' do
    @entity.author = nil
    expect(@entity).to_not be_valid
  end
end

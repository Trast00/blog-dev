require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:first_user) { User.first }
  let!(:second_user) { User.second }
  let!(:users) { [first_user, second_user] }
  it 'displays usernames of all users' do
    visit '/'
    users.each do |user|
      expect(page).to have_text(user.name)
    end
  end

  it 'displays images of all users' do
    visit '/'
    users.each do |user|
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
  end

  it 'displays post count of all users' do
    visit '/'
    users.each do |user|
      expect(page).to have_text("Number of post: #{user.posts_count}")
    end
  end

  it 'clicks on user and shows bio' do
    visit '/'
    users.each do |user|
      click_on user.name
      expect(has_current_path?("/users/#{user.id}", wait: 5)).to be_truthy
      visit '/'
    end
  end
end

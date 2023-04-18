require 'rails_helper'

# test for index view of users
RSpec.describe 'Users', type: :system do
  let!(:first_user) do
    User.create(name: 'Tom 3',
                photo: 'https://avatars.githubusercontent.com/u/74411135?s=400&u=ab8a7e4c6500ab7f1e058755215e500e82f0821a&v=4',
                bio: 'Teacher from Mexico.', posts_count: 15)
  end
  let!(:second_user) do
    User.create(name: 'Lilly 3',
                photo: 'https://cdn.vectorstock.com/i/preview-1x/10/70/super-cool-pizza-character-cartoon-vector-15811070.webp',
                bio: 'Teacher from Poland.')
  end
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

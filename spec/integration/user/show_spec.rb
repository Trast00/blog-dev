require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:first_user) { User.first }
  let!(:second_user) { User.second }
  let!(:users) { [first_user, second_user] }
  it 'username of all users' do
    users.each do |user|
      visit "/users/#{user.id}"
      expect(page).to have_text(user.name)
    end
  end

  it 'can see the user profile picture' do
    users.each do |user|
      visit "/users/#{user.id}"
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
  end

  it 'can see the number of posts the user has written' do
    users.each do |user|
      visit "/users/#{user.id}"
      expect(page).to have_text("Number of post: #{user.posts_count}")
    end
  end

  it 'user and shows bio' do
    users.each do |user|
      visit "/users/#{user.id}"
      expect(page).to have_text('Bio')
      expect(page).to have_text(user.bio.to_s)
    end
  end

  it 'can see the user first 3 posts' do
    users.each do |user|
      # create post for tested user
      Post.create(author: user, title: 'Hello1', text: 'This is my first post')
      Post.create(author: user, title: 'Hello2', text: 'This is my first post')
      Post.create(author: user, title: 'Hello3', text: 'This is my first post')
      Post.create(author: user, title: 'Hello4', text: 'This is my first post')

      visit "/users/#{user.id}"
      expect(page).to have_selector('.post', count: 3)
    end
  end

  it 'can see a button that lets me view all of a user posts' do
    visit "/users/#{first_user.id}"
    expect(page).to have_text('See All Posts')
  end

  it 'click on post should redirect to show post' do
    users.each do |user|
      # create post for tested user
      Post.create(author: user, title: 'Hello1', text: 'This is my first post')
      Post.create(author: user, title: 'Hello2', text: 'This is my first post')
      Post.create(author: user, title: 'Hello3', text: 'This is my first post')
      Post.create(author: user, title: 'Hello4', text: 'This is my first post')

      visit "/users/#{user.id}"

      post = user.recent_post.first
      click_on post.id

      expect(has_current_path?("/users/#{user.id}/posts/#{post.id}", wait: 5)).to be_truthy
    end
  end

  it 'click to see all posts, it redirects me to the users posts index page' do
    users.each do |user|
      # create post for tested user
      Post.create(author: user, title: 'Hello1', text: 'This is my first post')
      Post.create(author: user, title: 'Hello2', text: 'This is my first post')
      Post.create(author: user, title: 'Hello3', text: 'This is my first post')
      Post.create(author: user, title: 'Hello4', text: 'This is my first post')

      visit "/users/#{user.id}"
      click_on 'btn-show-posts'

      expect(has_current_path?("/users/#{user.id}/posts", wait: 5)).to be_truthy
    end
  end
end

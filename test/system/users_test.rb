require 'application_system_test_case'
require 'test_helper'

class Users < ApplicationSystemTestCase

  test "username of all users" do
    visit "/users"
    assert_text users(:first_user).name
    assert_text users(:second_user).name
  end

  test "image  of all users" do
    visit "/users"
    users.each do |user|
      assert page.has_selector?("img[src='#{user.photo}']")
    end
  end

  test "post count of all users" do
    visit "/users"
    users.each do |user|
      assert_text "Number of post: #{user.posts_count}"
    end
  end

  test "click on user" do
    visit "/users"
    users.each do |user|
      click_on user.name
      assert_text "Bio" # Bio is available only on "user/show" page
    end
  end

end
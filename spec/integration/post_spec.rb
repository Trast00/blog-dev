require "rails_helper"

RSpec.describe "Post", type: :system do
  before(:all) do
    @user = User.first

    post1 = Post.create(author: @user, title: 'Hello1', text: 'This is my first post')
    post2 = Post.create(author: @user, title: 'Hello2', text: 'This is my first post')
    post3 = Post.create(author: @user, title: 'Hello3', text: 'This is my first post')
    post4 = Post.create(author: @user, title: 'Hello4', text: 'This is my first post')
    post5 = Post.create(author: @user, title: 'Hello5', text: 'This is my first post')
    
    @posts = [post1, post2, post3, post4, post5]
    
    @comments = Comment.all
  end
  context "test post index" do

    before(:each) do
      visit "/users/#{@user.id}/posts"
    end
    it "can see the user's profile picture" do
      expect(page).to have_selector("img[src='#{@user.photo}']")
    end

    it "can see the user's username" do
      expect(page).to have_text(@user.name)
    end

    it "can see the number of posts the user has written" do
      expect(page).to have_text("Number of post: #{@user.posts_count}")
    end

    it "can see a post title" do
      @posts.each do |post|
        expect(page).to have_text(post.title)
      end
    end

    it "can see a post body" do
      @posts.each do |post|
        expect(page).to have_text(post.text)
      end
    end

    it "can see the first comments on a post" do
      first_comment = Comment.create(post: @posts[0], author: @user, text: 'first comment' )
      Comment.create(post: @posts[0], author: @user, text: 'second comment' )
      visit "/users/#{@user.id}/posts"
      expect(page).to have_text(first_comment.text)
    end

    it "can see how many comments a post has" do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_text("Comments:")
    end

    it "can see how many likes a post has" do
      visit "/users/#{@user.id}/posts"
      expect(page).to have_text("Likes:")
    end

    it "can see how many likes a post has" do
      expect(page).to have_text("Pagination")
    end

    it 'click on post should redirect to show post' do

      visit "/users/#{@user.id}/posts"
  
      post = @posts[0]
      click_on post.id

      expect(has_current_path?("/users/#{@user.id}/posts/#{post.id}", wait: 5)).to be_truthy
    end

  end

  context "test post show page" do
    before(:all) do
      @post = Post.includes(:comments, :author).find(@posts[0].id)
      visit "/users/#{@user.id}/posts/#{@post.id}"
    end

    it 'can see who wrote the post' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_text("by #{@user.name}")
    end

    it "can see how many comments a post has" do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_text("Comments:")
    end

    it "can see how many likes a post has" do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_text("Likes:")
    end

    it "can see the post body" do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_text(@post.text)
    end

    it "can see the username of each commentor" do
      @post.comments.each do |comment|
        visit "/users/#{@user.id}/posts/#{@post.id}"
        expect(page).to have_text(comment.author.name)
      end
    end

    it "can see the comment each commentor left" do
      @post.comments.each do |comment|
        visit "/users/#{@user.id}/posts/#{@post.id}"
        expect(page).to have_text(comment.text)
      end
    end
  end
end
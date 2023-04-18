require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:first_user) { User.first }
  let!(:first_post) { Post.create(author: first_user, title: 'Hello2', text: 'This is my first post') }

  it 'test GET index' do
    get "/users/#{first_user.id}/posts"
    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
  end
  it 'test GET show' do
    get "/users/#{first_user.id}/posts/#{first_post.id}"
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
  end
end

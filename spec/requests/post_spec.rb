require 'rails_helper'

RSpec.describe PostsController, type: :request do
  it 'test GET index' do
    get "/users/13/posts"
    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
    expect(response.body.include?('<button class="btn-show-post">Pagination</button>')
    ).to eq true
  end
  it 'test GET show' do
    get "/users/12/posts/12"
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    
    puts response.body
    expect(response.body.include?('<p>by username</p>')).to eq true
  end
end
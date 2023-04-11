require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'test GET index' do
    get '/'
    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
    expect(response.body.include?('<ul class="column no-style list-post">')).to eq true
  end
  it 'test GET show' do
    get '/users/12'
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    expect(response.body.include?('<h2>Bio</h2>')).to eq true
  end
end

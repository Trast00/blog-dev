require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let!(:first_user) { User.first }

  it 'test GET index' do
    get '/'
    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
    expect(response.body.include?('<ul class="column no-style list-post">')).to eq true
  end
  it 'test GET show' do
    get "/users/#{first_user.id}"
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    expect(response.body.include?('<h2>Bio</h2>')).to eq true
  end
end

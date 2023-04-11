require 'rails_helper'

RSpec.describe UsersController, type: :request do
  it 'test GET index' do
    get "/"
    expect(response.status).to eq(200)
    expect(response).to render_template(:index)
    expect(response.body.include?('<ul class="column no-style list-post">')).to eq true
  end
  it 'test GET show' do
    get "/users/12"
    expect(response.status).to eq(200)
    expect(response).to render_template(:show)
    expect(response.body.include?(
      '<section class="column borded bio">
      <h2>Bio</h2>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc auctor orci a elit faucibus, quis consectetur risus euismod. Duis sit amet enim quis nisl rutrum tincidunt ac in est. Donec quis sodales turpis. Integer quis metus lacus. Sed vestibulum tortor at tellus venenatis, ut maximus nibh malesuada. Phasellus ut odio arcu. Pellentesque sollicitudin, lectus non eleifend lobortis, ex sapien ultrices tellus, nec suscipit odio eros id mi. Quisque bibendum eleifend dui eget consequat. Integer consequat nibh quis ante dignissim elementum. Nam quis blandit ex. Sed congue nulla euismod tincidunt lacinia.</p>
    </section>')
    ).to eq true
  end
end
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end


  it 'posts_count should be present' do
    subject.posts_count = nil
    expect(subject).to_not be_valid
  end

  it 'posts_count should be integer greater or equal to 0' do
    expect(subject.posts_count).to be_kind_of Integer
    expect(subject.posts_count >= 0).to eql true
  end

  it 'test recent_post method' do
    result = subject.recent_post
    expect(result.length <= 3).to eq true
  end
end

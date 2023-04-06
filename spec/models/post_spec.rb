require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(author: User.create(name: 'Tom',
                                 photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.'),
             title: 'Hello3', text: 'This is my first post')
  end
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should have max length of 250' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'comments_count should be present' do
    subject.comments_count = nil
    expect(subject).to_not be_valid
  end

  it 'likes_count should be present' do
    subject.likes_count = nil
    expect(subject).to_not be_valid
  end

  it 'test recent_comment method' do
    result = subject.recent_comment
    expect(result.length <= 3).to eq true
  end
end

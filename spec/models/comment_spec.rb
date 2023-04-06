require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.create(
      post: Post.create(author: User.create(name: 'Tom',
                                            photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                            bio: 'Teacher from Mexico.'), title: 'Hello2',
                        text: 'This is my first post'),
      author: User.create(name: 'Tom',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.'),
      text: 'Hi eveyone'
    )
  end

  before { subject.save }

  it 'Comment should be valid' do
    expect(subject).to be_valid
  end

  it 'Comment should not be valid withou author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'Comment should not be valid withou post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end

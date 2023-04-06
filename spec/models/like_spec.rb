require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.create(
      post: Post.create(author: User.create(name: 'Tom',
                                            photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                                            bio: 'Teacher from Mexico.'), title: 'Hello2',
                        text: 'This is my first post'),
      author: User.create(name: 'Tom',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Mexico.')
    )
  end

  before { subject.save }

  it 'Like should be valid' do
    expect(subject).to be_valid
  end

  it 'Like should not be valid withou author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'Like should not be valid withou post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end

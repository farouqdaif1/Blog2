require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Farouq Daif', photo: 'link', bio: 'text', posts_counter: 10) }
  before { subject.save }
  it 'name should be presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'post counter should be integer' do
    subject.posts_counter = 1.222
    expect(subject).to_not be_valid
  end
  it 'post counter must 0 or greater than not negative numbers' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'test recent_posts method' do
    expect(subject.most_recent_posts.length).to be(0)
  end
end

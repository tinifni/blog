require 'spec_helper'

describe Post do
  let(:title) { "I am a post" }
  subject { Post.new(:title => title ) }

  it 'uses title for string representation' do
    subject.to_s.should == title
  end
end

describe Post, "validations" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end

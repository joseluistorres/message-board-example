require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:first_name) { 'Jose' }
  let(:last_name)  { 'Torres' }

  let(:user)      { FactoryGirl.build(:user, first_name: first_name, last_name: last_name) }
  before(:each) { @post = FactoryGirl.create(:post, user: user) }

  subject { @post }

  it { should respond_to(:title) }

  it "#title and #body returns a string" do
    expect(@post.title).to match 'My title post'
    expect(@post.body).to match 'MyString'
  end

  it "should fail to create an invalid post" do
    expect(FactoryGirl.build(:post, title: nil, user: user)).to_not be_valid
    expect(FactoryGirl.build(:post, body: nil, user: user)).to_not be_valid
  end
end

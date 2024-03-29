require 'spec_helper'

describe Micropost do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
  	@micropost = user.microposts.build(content: "Lorem ipsum")
  end

  subject { @micropost }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @micropost.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when content is blank" do
  	before { @micropost.content = " " }
  	it { should_not be_valid }
  end

  describe "when content is too long" do
  	before { @micropost.content = "A" * 141}
  	it { should_not be_valid }
  end
end

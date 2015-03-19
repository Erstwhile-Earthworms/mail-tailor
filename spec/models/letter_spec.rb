require 'rails_helper'

  # t.text :title
  # t.text :content
  # t.text :sender
  # t.integer :sender_id
  # t.integer :user_id

RSpec.describe Letter, :type => :model do
  let(:user) { FactoryGirl.create(:user) }


  before do
    @letter = user.letters.build(title: 'The Title', content: 'Some content')
  end

  subject { @letter }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:sender_id) }
  it { should respond_to(:user_id) }
  it { should be_valid }
  it { should respond_to(:user) }

  it "should have a user" do
    expect(@letter.user).to eq(user)
  end

  describe "when a user_id is not present" do
    before {@letter.user_id = nil }
    it { should_not be_valid }
  end

end

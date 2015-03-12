require 'rails_helper'

RSpec.describe User, :type => :model do

  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:email) }
  it { should be_valid }

  describe "when name not present" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe "when email not present" do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end
    it { should_not be_valid }
  end

end

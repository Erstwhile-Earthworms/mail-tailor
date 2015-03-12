require 'rails_helper'

RSpec.describe User, :type => :model do

  before { @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  describe "when name not present" do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe "when email not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      user_with_same_name = @user.dup
      user_with_same_name.save
    end
    it { should_not be_valid }
  end

  describe "when a password is not present" do
    before { @user = User.new(name: "Example User", email: "user@example.com", password: "", password_confirmation: "")}
    it { should_not be_valid }
  end

  describe "when a password doesn't match confirmation" do
    before { @user.password_confirmation= "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = 'a'*5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with a valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with an invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_falsey }
    end

  end

end

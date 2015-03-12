require 'rails_helper'

RSpec.describe "UserPages", :type => :request do

  subject { page }

  describe "signup page" do
    before { visit signup_path }
    it { is_expected.to have_content('Sign up') }
  end

  describe "individual user page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content(user.name) }
    it { should have_content(user.email) }
  end

end

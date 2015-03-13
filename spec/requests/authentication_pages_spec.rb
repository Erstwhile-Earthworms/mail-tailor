require 'rails_helper'

RSpec.describe "Authentication", :type => :request do

  describe "signin page" do
    subject { page }
    before { visit signin_path }

    it { should have_content('Sign in') }

    describe "with invalid information" do
      before { click_button 'Sign in' }

      it { should have_content('Sign in') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out',    href: signout_path) }

      describe "followed by signout" do
        before { click_link 'Sign out' }
        it { should have_link 'Sign in' }
        
      end
    end

    
  end

end

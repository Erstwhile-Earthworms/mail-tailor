require 'rails_helper'

RSpec.describe "Authentication", :type => :request do

  describe "signin page" do
    subject { page }
    before do 
      visit root_path 
      find('#login').click
    end

    it { should have_content('LOGIN') }

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        find('#session_email').set(user.email.upcase)
        find('#session_password').set(user.password)
        click_button "Sign in"
      end

      it { should have_link('LOGOUT',    href: signout_path) }

      describe "followed by signout" do
        before { click_link 'LOGOUT' }
        it { should have_content('LOGIN') }
      end

    end

    
  end

end

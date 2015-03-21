require 'rails_helper'

RSpec.describe "Authentication", :type => :request do

  describe "signin page" do
    subject { page }
    before do 
      visit root_path 
      find('#login').click
    end

    it { should have_content('LOGIN') }

    describe "with invalid information" do
      it "doesn't sing in with invalid info" do
        sign_in(User.new({email:'notvalid', password:'alsonotvalid'}))
        should_not have_link('LOGOUT',    href: signout_path)
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        sign_in(user)
      end

      # it { should have_link('LOGOUT',    href: signout_path) }
      it { should have_content 'SENDER' }

      # describe "followed by signout" do
      #   before { click_link 'LOGOUT' }
      #   it { should have_content('LOGIN') }
      # end

    end

    
  end

end

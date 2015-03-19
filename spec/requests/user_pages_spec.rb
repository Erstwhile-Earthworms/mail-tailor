require 'rails_helper'

RSpec.describe "UserPages", :type => :request do

  subject { page }

  describe "signup page" do
    before { visit root_path }
    it { is_expected.to have_content('CREATE') }
  end

  describe "signup" do
    before do 
      visit root_path 
      click_button 'CREATE'
    end
    let(:submit) { 'CREATE' }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        find('#name_input').set('Example User')
        find('#email_input').set('user@example.com')
        find('#password_input').set('foobar')
        find('#password_confirmation_input').set('foobar')
      end

      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

    end

  end

  describe "individual user page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_content(user.name) }
  end

end

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
      # click_button page.find('button', :text => 'CREATE')
      # click_link find_link('CREATE')
       page.all('a')[0].click
       # find_link('#create').click
    end
    let(:submit) { 'CREATE' }

    it "it has a create link" do
      expect(page.all('a')[0].text).to eq('CREATE')
    end

    describe "with invalid information" do
      it "should not create a user" do
        expect { find_by_id('modallog_create').click }.not_to change(User, :count)
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
    let!(:sender) { Sender.create(name:'sender.com', display_name: 'Sender')}
    let!(:letter1) { FactoryGirl.create(:letter, user:user, content:'Foo', sender:sender)}
    let!(:letter2) { FactoryGirl.create(:letter, user:user, content:'Bar', sender:sender)}

    describe "when not signed in" do

      it "should redirect back to login page" do
        visit user_path(user) 
        expect(current_path).to eq(root_path)
      end
    end

    describe "when properly signed in" do

      before do 
        sign_in(user)
        visit user_path(user) 
      end

      describe "letters" do
        it { should have_content(letter1.content) }
        it { should have_content(letter2.content) }
      end

    end

  end

end

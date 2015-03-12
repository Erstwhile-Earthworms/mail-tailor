require 'rails_helper'

RSpec.describe "Static pages", :type => :request do

  describe "Home page" do

    it "home page has welcome message" do
      visit '/static_pages/home'
      expect(page).to have_content('Welcome to MailTailor')
    end

  end

end

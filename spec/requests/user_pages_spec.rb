require 'rails_helper'

RSpec.describe "UserPages", :type => :request do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { is_expected.to have_content('Sign up') }
    
  end

end

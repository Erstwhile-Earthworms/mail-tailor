require 'rails_helper'

RSpec.describe "EmailProcessor", :type => :request do

  describe "with a valid email posted to EmailProcessor" do

    let(:email) { fake_sendgrid_params("This is a test") }

    describe "when there is a matching user in the database" do
      let!(:user) { FactoryGirl.create(:user, mtname:'griddles') }

      it "creates a new Letter" do
        expect { page.driver.post(email_processor_path, email) }.to change(Letter, :count)
      end

      describe "when there is no matching sender in the database" do
        it "creates a new Sender" do
          expect(Sender.all.count).to be 0
          expect { page.driver.post(email_processor_path, email) }.to change(Sender, :count)
        end
      end

      describe "when there is a  matching sender in the database already" do
        let!(:sender) { Sender.create(name:'smith.com') }
        it "does not create a new Sender" do
          expect(Sender.all.count).to be 1
          expect { page.driver.post(email_processor_path, email) }.not_to change(Sender, :count)
        end
      end

    end


    describe "when there is no matching user in the database" do

      it "does not create a new Letter" do
        expect(User.all.count).to be 0
        expect { page.driver.post(email_processor_path, email) }.not_to change(Letter, :count)
      end

      it "does not create a new Sender" do
        expect(Sender.all.count).to be 0
        expect { page.driver.post(email_processor_path, email) }.not_to change(Sender, :count)
      end

    end



  end

  def fake_sendgrid_params(message)
    {
      to: 'Mr. Griddles <griddles@example.com>',
      from: 'Bob Smith <bob@smith.com>',
      text: message,
    }
  end
end

require 'rails_helper'

RSpec.describe Sender, :type => :model do

  before do
    @sender = Sender.new(name:'LinkedIn')
  end

  subject{ @sender }

  it { should respond_to(:name) }

  describe "letters associations" do
    before { @sender.save }

    let(:user) { FactoryGirl.create(:user) }
    let!(:older_letter) { FactoryGirl.create(:letter, user: user, created_at: 1.day.ago, sender:@sender) }
    let!(:newer_letter) { FactoryGirl.create(:letter, user: user, created_at: 1.hour.ago, sender:@sender) }

    it "should have the right letters in the right order" do
      expect(@sender.letters).to eq [newer_letter, older_letter]
    end

    it "should destroy associated letters" do
      letters = @sender.letters.to_a
      @sender.destroy
      expect(letters).to_not be_empty

      letters.each do |letter|
        expect(Letter.where(id:letter.id)).to be_empty
      end

    end



  end
end



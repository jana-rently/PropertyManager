require 'rails_helper'
RSpec.describe Renter, type: :model do
  before(:all) do
    @renter = FactoryGirl.build(:renter)
  end   
  #Devise callback validations
  describe "renter sign up" do
    it "sendmail" do
      @renter = FactoryGirl.create(:renter)
      expect(Devise.mailer.deliveries.count).to eq 1
    end
  end

  context "Validations" do
    it "renter is valid with valid attributes" do
      #puts"renter model validations"
      expect(@renter).to be_valid
    end
  end

  context "Invalid" do
    it " renter is not valid without a name" do 
      newrenter = build(:renter, name:nil)
      expect(newrenter).to_not be_valid
    end

    it "renter is not valid without a valid email" do 
      newrenter = build(:renter, email: "ksjdlkj")
      expect(newrenter).to_not be_valid
    end

    it "renter is not valid without a valid password" do 
      newrenter = build(:renter, password: "dkjsdkl")
      expect(newrenter).to_not be_valid
    end

    it "renter is not valid without a valid 10 digit numerical contact" do 
      newrenter = build(:renter, contact:98989898)
      expect(newrenter).to_not be_valid
    end

    it "renter Presence of address" do 
      newrenter = build(:renter, address:nil)
      expect(newrenter).to_not be_valid
    end

  end
end

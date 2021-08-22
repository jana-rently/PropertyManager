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
  
  #Renter is valid with all valid inputs
  context "Validations" do
    it "renter is valid with valid attributes" do
     
      expect(@renter).to be_valid
    end
  end
  
  #Renter is invalid if any of the input is invalid
  context "Invalid" do
    it " renter is not valid without a name" do 
      newrenter = build(:renter, name:nil)
      expect(newrenter).to_not be_valid
    end

    #Renter is invalid without valid email
    it "renter is not valid without a valid email" do 
      newrenter = build(:renter, email: "ksjdlkj")
      expect(newrenter).to_not be_valid
    end

    #Renter is invalid without valid password
    it "renter is not valid without a valid password" do 
      newrenter = build(:renter, password: "dkjsdkl")
      expect(newrenter).to_not be_valid
    end

    #Renter is invalid without valid contact
    it "renter is not valid without a valid 10 digit numerical contact" do 
      newrenter = build(:renter, contact:98989898)
      expect(newrenter).to_not be_valid
    end

    #Renter is invalid without address
    it "renter Presence of address" do 
      newrenter = build(:renter, address:nil)
      expect(newrenter).to_not be_valid
    end

  end

end

require 'rails_helper'
RSpec.describe Agent, type: :model do
  before(:all) do
    @company=FactoryGirl.create(:company)
    @agent = FactoryGirl.build(:agent,company_id:@company.id)
  end   

  #checks the devise confirmable module to send email confirmation
  describe "agent sign up" do
    it "sendmail" do
      @agen = FactoryGirl.create(:agent,company_id:@company.id)
      expect(Devise.mailer.deliveries.count).to eq 1
    end
  end
  
  context "Validations" do
    it "Agent is valid with valid attributes" do
      expect(@agent).to be_valid
    end
  end

  context "Invalid" do
    it " Agent is not valid without a name" do 
      newagent = build(:agent, name:nil)
      expect(newagent).to_not be_valid
    end

    it "Agent is not valid without a valid email" do 
      
      newagent = build(:agent, email: "ksjdlkj")
      expect(newagent).to_not be_valid
    end

    it "Agent is not valid without a valid password" do 
     
      newagent = build(:agent, password: "dkjsdkl")
      expect(newagent).to_not be_valid
    end

    it "Agent is not valid without a valid 10 digit numerical contact" do 
      newagent = build(:agent, contact:98989898)
      expect(newagent).to_not be_valid
    end

    it "Agent Presence of address" do 
     
      newagent = build(:agent, address:nil)
      expect(newagent).to_not be_valid
    end

  end
end

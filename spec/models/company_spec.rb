require 'rails_helper'
RSpec.describe Company, type: :model do

  before do
    @company = FactoryGirl.create(:company)
  end   


  #checks the validation with proper inputs
  context "Validations" do
    it "Company is valid with valid attributes" do
      expect(@company).to be_valid
    end
  end

  #checks the invalidations with improper inputs
  context "Invalid" do

    #checking validity with improper name and expect it should not be valid
    it " Company is not valid without a name" do 
      newcompany = build(:company, companyname:nil)
      expect(newcompany).to_not be_valid
    end

    #checking validity with improper address and expect it should not be valid
    it "Company is not valid without a address" do 
      newcompany = build(:company, location:nil)
      expect(newcompany).to_not be_valid
    end

    #checking validity with improper year and expect it should not be valid
    it "Company is not valid without a valid Year" do 
      newcompany = build(:company, year: 2024)
      expect(newcompany).to_not be_valid
    end

end
  
end

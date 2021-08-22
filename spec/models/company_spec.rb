require 'rails_helper'
RSpec.describe Company, type: :model do
  before do
    @company = FactoryGirl.create(:company)
  end   

  context "Validations" do
    it "Company is valid with valid attributes" do
      expect(@company).to be_valid
    end
  end
  context "Invalid" do
    it " Company is not valid without a name" do 
      newcompany = build(:company, companyname:nil)
      expect(newcompany).to_not be_valid
    end

    it "Company is not valid without a address" do 
      
      newcompany = build(:company, location:nil)
      expect(newcompany).to_not be_valid
    end

    it "Company is not valid without a valid Year" do 
      newcompany = build(:company, year: 2024)
      expect(newcompany).to_not be_valid
    end

end
  
end

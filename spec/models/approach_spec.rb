require 'rails_helper'
RSpec.describe Approach, type: :model do
  
  before do
    @company=Company.create(companyname:"comp",year:"2011",about:"nice",location:"mtp")
    @property = FactoryGirl.create(:property,company_id:@company.id)
    @renter = FactoryGirl.create(:renter)
    @approach = FactoryGirl.create(:approach,property_id:@property.id,renter_id:@renter.id)
  end   


  #checks the validity of approaches with uniqueness
  context "Validations" do
    it "property and renter should be added only once" do
      expect(@approach).to be_valid
    end
  end

  #checks the validity with different approch
  context "Invalid" do
    it " Same property can't be added by the same renter again" do 
      @renter = FactoryGirl.create(:renter,email:"j@gmail.com")
      @property = FactoryGirl.create(:property,company_id:@company.id)
      @nextapproach=FactoryGirl.create(:approach,renter_id:@renter.id,property_id:@property.id)
      expect(@nextapproach).to be_valid
    end

   end

end

require 'rails_helper'
RSpec.describe Wishlist, type: :model do

  before do
    @company=Company.create(companyname:"comp",year:"2011",about:"nice",location:"mtp")
    @property = FactoryGirl.create(:property,company_id:@company.id)
    @renter = FactoryGirl.create(:renter)
    @wishlist = FactoryGirl.build(:wishlist,property_id:@property_id,renter_id:@renter.id)
  end   

  
  #checks the validity of wishllist with uniqueness
  context "Validations" do
    it "property and renter should be added only once" do
      expect(@wishlist).to be_valid
    end
  end

  #checks the validity of wishlist with different inputs
  context "Invalid" do
    it " Same property can't be added to the wishlist" do 
        @renter=Renter.create(name:"somename",email:"somemail@gmail",password:"J@1270725j",address:"someaddress")
        @nextwish=FactoryGirl.build(:wishlist,renter_id:@renter.id,property_id:@property.id)
        expect(@nextwish).to be_valid
    end

   end
   
end

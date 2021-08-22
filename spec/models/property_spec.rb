require 'rails_helper'
RSpec.describe Property, type: :model do

  before(:each) do
    @company=Company.create(companyname:"comp",year:"2011",about:"nice",location:"mtp")
    @property = FactoryGirl.create(:property,company_id:@company.id)
  end

  context "Validatable with proper input" do
  it "validation" do
    expect(@property).to be_valid
  end
  end

  context "Validatable with proper input" do
  it "unvalid due to no name" do
    newcompany = build(:company, companyname:nil)

    expect(newcompany).to_not be_valid
  end
  end

end

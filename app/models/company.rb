class Company < ApplicationRecord
    #associaitons
    has_many :properties,dependent: :destroy
    has_many :agents,dependent: :destroy

    #company field validations 
    validates_presence_of :companyname, :message => "Company name can't be empty"
    validates_presence_of :location, :message => " Provide your company address"
    validates_presence_of :about, :message => " Company description can't be empty"

    #year validation 

    #should be four digits and it should between 1900 and current year 
    validates :year, 
    presence: true,
    inclusion: { in: 1900..Date.today.year },
    format: { 
      with: /(19|20)\d{2}/i, 
      message: "Should be a four-digit year, till current year"}
end

class Rentedlist < ApplicationRecord  
  
  #Associations
  belongs_to :property, optional: true
  belongs_to :renter, optional: true

  #validation for uniqueness 
  validates_uniqueness_of :renter_id, scope: :property_id

  #callback to send email to renters 
  after_save :send_mail

    def send_mail
       # getting agent, property, renters object for sending email
        @renter= Renter.find(self.renter_id)
        @property=Property.find(self.property_id)
        @agent=Agent.where(company_id:@property.company_id).first
        #flag updation for rented or not
        @property.update(flag: 1)

        #sending email to renters that Agent has accepted his approach
        UserMailer.propertyrented(@renter,@agent,@property).deliver

        # sending email to those who are approached as it was allocated for someone except the allocated renter
        @approach=Approach.where(renter_id:@renter.id,property_id:@property.id).take
        @approach.destroy
        @check=Approach.where(property_id: @property.id).all
        @check.each do |obj|
        @renter=Renter.find(obj.renter_id)
        @agent=Agent.where(company_id:@property.company_id)
        UserMailer.propertybooked(@renter,@agent,@property).deliver_now
        end

    end
end

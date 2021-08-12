class Rentedlist < ApplicationRecord
    belongs_to :property, optional: true
    belongs_to :renter, optional: true
    validates_uniqueness_of :renter_id, scope: :property_id
    after_save :send_mail

    def send_mail
       # getting agent, property, renters object for sending email
        @agent=Agent.first
        @renter= Renter.find(self.renter_id)
        @property=Property.find(self.property_id)
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
         @agent=Agent.first
          UserMailer.propertybooked(@renter,@agent,@property).deliver_now
         end

    end
end

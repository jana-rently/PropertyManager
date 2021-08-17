class Review < ApplicationRecord
    
    #Associaiton
    belongs_to :property, optional: true
    belongs_to :renter, optional: true
    #validaiton
    validates :property_id, uniqueness: true, on: :create
end

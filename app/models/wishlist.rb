class Wishlist < ApplicationRecord
    
    #Association
    belongs_to :property, optional: true
    belongs_to :renter, optional: true
    #validation
    validates_uniqueness_of :renter_id, scope: :property_id

end

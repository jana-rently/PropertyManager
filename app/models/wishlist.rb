class Wishlist < ApplicationRecord
    belongs_to :property, optional: true
    belongs_to :renter, optional: true
    validates_uniqueness_of :renter_id, scope: :property_id

end

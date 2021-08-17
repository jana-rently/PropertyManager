class Approach < ApplicationRecord

  #associaitons
  belongs_to :Property, optional: true
  belongs_to :Renter, optional: true
  #validations

  #validating the uniqueness of renter id and property id to avoid duplicaitons
  validates_uniqueness_of :renter_id, scope: :property_id
end

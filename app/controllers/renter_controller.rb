class RenterController < ApplicationController
    def show
        @propertylist=Property.all
        @renter=current_renter
    end
    def applied
        @renter=current_renter
        #@propertylist=Approach.where(renter_id: @renter.id).all
        @propertylist=@renter.approaches
    end
end

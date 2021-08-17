class Property < ApplicationRecord
    
    #associations
    has_many :reviews, dependent: :destroy
    has_many :approaches, dependent: :destroy
    has_many_attached :images
    belongs_to :company

    #validaiting the image type
    validate :image_type

    #validations

    #Property name
    validates_presence_of :name, :message => "of the property can't be empty"

    #Property Address
    validates_presence_of :address, :message => "can't be empty"

    #Rent
    validates_presence_of :rent, :message => "Provide the rent"

    #Bedrooms
    validates :bedrooms, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 7}

    def thumbnail input
        return self.images[input].variant(resize: '300X250>').processed
    end

    # validation for image type of property
    private 
    def image_type
        if images.attached? == false
            errors.add(:images, "missing")
        end
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images , "should be jpeg or png")
            end
        end
    end
end

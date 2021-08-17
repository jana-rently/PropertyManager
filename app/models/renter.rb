class Renter < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable
         :token_authenticatable

  #Associations       
  has_many :rentedlists,dependent: :destroy
  has_many :wishlists,dependent: :destroy
  has_many :approaches, dependent: :destroy
  
  #validations 
  #name
  validates_presence_of :name, :message => "name can't be empty"
  #Address
  validates_presence_of :address, :message => "Please provide your address"
  #password validation
  validates :password, 
                format: { with: /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/,
                          message: 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
                        }
  #validating contact
  validates_format_of :contact, :with => /[0-9]{10}/ ,:message => "Contact should be 10 digit number"

end

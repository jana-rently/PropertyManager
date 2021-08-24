class Agent < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable, :lockable 
  
  #associations         
    belongs_to :company, :optional => true
    has_many :properties, through: :company
      
  #validations
     validates_presence_of :name, :message => "name can't be empty"
     validates_presence_of :address, :message => "Please provide your address"
     
  #validating password     
     validates :password, 
                         format: { with: /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/,
                                   message: 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
                                 }
  #validating contact
      validates_format_of :contact, :with => /[0-9]{10}/ ,:message => "Contact should be 10 digit number"
         

  #api authentication with email and password           
    def self.authenticate(email, password)
      agent = Agent.find_for_authentication(email: email)
      agent&.valid_password?(password) ? agent : nil
    end


end

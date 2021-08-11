class Agent < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable 
         
         belongs_to :company, :optional => true
         has_many :properties, through: :company, dependent: :destroy
         

validates :password, 
            format: { with: /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{7,}\z/,
                      message: 'Password should have more than 7 characters including 1 uppercase letter, 1 number, 1 special character'
                    }

end

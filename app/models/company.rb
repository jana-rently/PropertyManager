class Company < ApplicationRecord
    has_many :properties,dependent: :destroy
    has_many :agents,dependent: :destroy
    validates_presence_of :companyname, :message => " company name can't be empty"
end

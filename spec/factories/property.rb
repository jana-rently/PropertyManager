  FactoryGirl.define do
    factory :property do
      name {"Sevilla Home"}
      address {"ddvdv"}
      rent {"1233"}
      company_id {120}
        bedrooms {5}
      after(:build) do |culture|
        culture.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'soy.jpeg')), filename: 'soy.jpeg', content_type: 'image/jpeg')
      end 
    end
  end
  
  
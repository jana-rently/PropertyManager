FactoryGirl.define do
    factory :agent do
        email {'jana_s@gmail.com'}
        name {'jann'}
        password {'J@1270725j'}
        password_confirmation {'J@1270725j'}
        role {"Admin"}
        address{"abce"}
        contact{"9898989898"}
        #confirmed_at Time.now
    end
  end

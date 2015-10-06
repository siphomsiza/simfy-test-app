FactoryGirl.define do
  factory :album do
    name {Faker::Lorem.sentence(3)}
    association(:artist)
    release_date {Date.today}
    
    factory :invalid_album do
      name nil
    end
  end
end

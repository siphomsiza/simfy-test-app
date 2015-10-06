FactoryGirl.define do
  factory :song do
    title {Faker::Lorem.sentence(3)}
    association(:album)
    duration {60}
    
    factory :invalid_song do
      title nil
    end  
  end
end

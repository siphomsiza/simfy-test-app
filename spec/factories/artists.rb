# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :artist do
    name {Faker::Lorem.sentence(3)}
    
    factory :invalid_artist do
      name nil
    end
  end
end

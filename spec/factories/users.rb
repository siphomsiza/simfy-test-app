FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email()}
    password {Faker::Internet.password()}

    before(:create) do |user|
      pass = Faker::Lorem.words(8)
      user.password = pass
      user.password_confirmation = pass
    end


    factory :unconfirmed_user do
      after(:create) do |user|
        user.confirmed_at = nil
        user.save
      end
    end

    factory :user_with_password do
      password 'secret'
      password_confirmation 'secret'
    end

    factory :super_user do
      admin true
    end
  end
end

FactoryGirl.define do
  sequence(:email) { |n| "user_#{n}@test.com" }

  factory :user do
    name "Test User"
    email
    password "please123"
    role 'user'

    trait :admin do
      role 'admin'
    end

    trait :advisor do
      role 'advisor'
    end

    trait :captain do
      role 'captain'
    end

    trait :guard do
      role 'guard'
    end
  end
end

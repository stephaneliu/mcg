FactoryGirl.define do
  factory :user do
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :advisor do
      role 'advisor'
    end

    trait :captain do
      role 'captain'
    end

  end
end

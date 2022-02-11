FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}"}
    sequence(:email) { |n| "test#{n}@example.com"}
    password{ "password" }
    password_confirmation{ "password" }
    profile{ "テストデータ" }
    admin{false}

    trait :admin do
      name{ "admin" }
      email{ "admin@gmail.com" }
      admin{ true }
    end

    trait :general do
      name{ "general" }
      email{ "general@gmail.com" }
      admin{ false }
    end
  end
end

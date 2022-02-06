FactoryBot.define do
  factory :user do
    name{ "test" }
    email { "test@gmail.com" }
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

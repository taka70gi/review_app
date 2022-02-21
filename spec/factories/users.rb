FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    profile { "テストデータ" }
    admin { false }
    after(:build) do |user|
      user.image.attach(io: File.open(Rails.root.join("spec/fixtures/files/star_img.png")), filename: "star_img.png")
    end

    trait :admin do
      name { "admin" }
      email { "admin@gmail.com" }
      admin { true }
    end

    trait :general do
      name { "general" }
      email { "general@gmail.com" }
      admin { false }
    end
  end
end

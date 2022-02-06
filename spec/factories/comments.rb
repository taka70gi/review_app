FactoryBot.define do
  factory :comment do
    content{ "テストデータ" }
    user_id{ 1 }
    drama_id{ 1 }
  end
end

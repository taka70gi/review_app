FactoryBot.define do
  factory :comment do
    content{ "テストのレビューです。" }
    user_id{ user.id }
    drama_id{ drama.id }
    user
    drama
  end
end

FactoryBot.define do
  factory :favorite do
    user_id{ user.id }
    drama_id{ drama.id }
    user
    drama
  end
end

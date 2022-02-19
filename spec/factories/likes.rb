FactoryBot.define do
  factory :like do
    user_id{ user.id }
    comment_id{ comment.id }
    user
    comment
  end
end

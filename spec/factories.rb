FactoryBot.define do
  factory :post do
    title { "Some name" }
    body { "Some content" }
  end

  factory :comment do
    username { "Someone" }
    body { "Some content" }

    post
  end
end

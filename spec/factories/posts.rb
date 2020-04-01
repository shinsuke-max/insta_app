FactoryBot.define do
  factory :post do
    caption { "heyheyhey" }
    association :user
  end
end

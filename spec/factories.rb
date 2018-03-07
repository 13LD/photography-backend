FactoryBot.define do
  factory :post do
    title "title"
    description "description"
  end

  factory :user do
    sequence(:email){|n| "user#{n}@gmail.com" }
    password "12345678"
    password_confirmation "12345678"
    sequence(:name){|n| "user_name#{n}" }
  end
end
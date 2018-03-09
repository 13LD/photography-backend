FactoryBot.define do
  factory :api_user, class: 'Api::User' do
    
  end
  factory :post do
    title "title"
    description "description"
  end

  factory :user do
    sequence(:email){|n| "user#{n}@gmail.com" }
    password "hunter96"
    password_confirmation "hunter96"
    sequence(:name){|n| "user_name#{n}" }
  end
end
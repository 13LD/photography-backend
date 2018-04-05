FactoryBot.define do
  
  factory :photo do
    file "MyString"
    tag
  end
  factory :tag do
    tag_name "MyString"
  end
  factory :auth_token do
    token "MyString"
  end

  factory :post do
    title "title"
    description "description"
    image do
      # you'll get an error if the file doesn't exist
      File.open(File.join(Rails.root, 'spec', 'support', 'test.png'))
    end
  end

  factory :user do
    sequence(:email){|n| "user#{n}@gmail.com" }
    password "hunter96"
    password_confirmation "hunter96"
    sequence(:name){|n| "user_name#{n}" }
  end

  factory :comment do

    title "title"
    content "content"
    user
    post
  end
end
FactoryBot.define do
  factory :equipment do
    name "MyString"
    description "MyString"
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

  factory :tag do
    tag_name "MyString"
  end

  factory :photo do
    file do
      # you'll get an error if the file doesn't exist
      File.open(File.join(Rails.root, 'spec', 'support', 'test.png'))
    end
    tag
  end

  factory :service do
    package_name "MyString"
  end

  factory :service_item do
    description "MyString"
    service
  end
end
FactoryGirl.define do
  factory :user do
    email 'aa@bb.c'
    password '1234567890'
    password_confirmation '1234567890'
  end
  factory :categories do
    name "Ruby"
  end
end
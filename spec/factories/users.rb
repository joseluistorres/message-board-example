FactoryGirl.define do
  factory :user do
    confirmed_at Time.now
    first_name "JL"
    last_name "Torres"
    description "Yo soy el patron"
    email "test@example.com"
    password "password"
  end
end

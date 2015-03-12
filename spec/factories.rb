FactoryGirl.define do
  factory :user do
    name "Alice Smith"
    email "alice@smith.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

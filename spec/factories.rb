FactoryGirl.define do
  factory :user do
    name "Alice Smith"
    email "alice@smith.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :sender do
    name "LinkedIn"
  end

  factory :letter do
    title "An email"
    content "Dear Sir or Ma'am, blah blah"
    user
    sender
  end


end

FactoryGirl.define do
  factory :user do
    name "Alice Smith"
    email "alice@smith.com"
    password "foobar"
    password_confirmation "foobar"
  end

  # t.text :title
  # t.text :content
  # t.text :sender
  # t.integer :sender_id
  # t.integer :user_id

  factory :letter do
    title "An email"
    content "Dear Sir or Ma'am, blah blah"
    user
  end

end

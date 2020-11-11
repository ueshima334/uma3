FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"a1a1a1"}
    password_confirmation {password}
  end
end
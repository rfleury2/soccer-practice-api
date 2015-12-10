FactoryGirl.define do
  factory :team do
    name Faker::Address.city
  end
end

FactoryGirl.define do
  factory :season do
    association :league, factory: :league
    year "2015"
    division "1"

    trait :second_division do
    	division "2"
    end
  end
end

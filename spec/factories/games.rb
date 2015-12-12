FactoryGirl.define do
  factory :game do
    date Date.today()
    association :season, factory: :season
    association :league, factory: :league
    association :home_team, factory: :team
    association :away_team, factory: :team
    home_goals [1,2,3,4].sample
    away_goals [1,2,3,4].sample
	  
	  trait :second_division do
	  	association :season, factory: [:season, :second_division]
	  end
  end
end

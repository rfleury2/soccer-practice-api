FactoryGirl.define do
  factory :game do
    date Date.today()
    season "2015"
    association :home_team, factory: :team
    association :away_team, factory: :team
    home_goals [1,2,3,4].sample
    away_goals [1,2,3,4].sample
    division '1'
    league 'England'
  end
end

FactoryGirl.define do
  factory :league do
    country ['england', 'germany', 'holland', 'italy', 'spain'].sample

    trait :english do
    	country 'england'
    end

    trait :german do
    	country 'germany'
    end

    trait :italian do
    	country 'italy'
    end

    trait :dutch do
    	country 'holland'
    end

    trait :spanish do
    	country 'spain'
    end
  end
end

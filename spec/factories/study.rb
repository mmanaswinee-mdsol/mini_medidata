FactoryBot.define do
 
  factory :study do
    name {"name1"}
    age_limit { rand(10..100) }
    drug { "drug1" }
    phase { 0 }
    symptoms { 'fever, cough'}
    blood_group { ['a+', 'a-', 'b+']}
    study_group_id { 1 }

    association :study_group
  end
end
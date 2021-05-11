FactoryBot.define do
  factory :enrollment do
    study { nil }
    subject { nil }
  end

    factory :study do
      name {"name1"}
      age_limit { 27 }
      drug { "drug1" }
    end
  end
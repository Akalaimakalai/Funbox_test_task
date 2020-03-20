FactoryBot.define do
  factory :dummy do
    value { 88.00 }
    deadline { 1.hour.from_now }
  end

  trait :invalid do
    value { nil }
  end
end

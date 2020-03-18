FactoryBot.define do
  factory :exchange_rate do
    name { "TestValuteName" }
    char_code { "TVN" }
    value { 42.00 }
  end
end

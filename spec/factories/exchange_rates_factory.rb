FactoryBot.define do

  sequence :name do |n|
    "TestValuteName_#{n}"
  end

  sequence :char_code do |n|
    "TVN_#{n}"
  end

  factory :exchange_rate do
    name
    char_code
    value { 42.00 }
  end
end

FactoryBot.define do
  factory :save_money_wallet do
    title { "MyString" }
    description { "MyText" }
    value { "9.99" }
    date { "2021-08-21" }
    user { nil }
    save_money { nil }
  end
end

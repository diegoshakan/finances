FactoryBot.define do
  factory :save_money_wallet do
    title { "Investimento" }
    description { "Ações" }
    value { rand(100..2000).to_f }
    date { "2021-08-21" }
  end
end

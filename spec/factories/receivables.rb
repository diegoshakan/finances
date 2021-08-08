FactoryBot.define do
  factory :receivable do
    title { FFaker::Music.album }
    description { FFaker::Movie.title }
    value { "9.99" }
    date { "2021-08-08" }
  end
end

FactoryBot.define do
  factory :payment do
    title { FFaker::Music.album }
    description { FFaker::Movie.title }
    value { rand(100..2000).to_f }
    date { "2021-08-08" }
  end
end

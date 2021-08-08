FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { 'changeme' }
    password_confirmation { 'changeme' }
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
  end
end

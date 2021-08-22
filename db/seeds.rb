# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = FactoryBot.create(:user, email: 'diego@example.com')
user2 = FactoryBot.create(:user, email: 'aimee@example.com')

FactoryBot.create_list(:receivable, 2, user: user1)
FactoryBot.create_list(:payment, 2, user: user1)

FactoryBot.create_list(:receivable, 2, user: user2)
FactoryBot.create_list(:payment, 2, user: user2)

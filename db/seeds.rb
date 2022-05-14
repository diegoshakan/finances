user1 = FactoryBot.create(:user, email: 'diego@example.com')
user2 = FactoryBot.create(:user, email: 'aimee@example.com')

FactoryBot.create_list(:receivable, 2, user: user1)
FactoryBot.create_list(:payment, 2, user: user1)

FactoryBot.create_list(:receivable, 2, user: user2)
FactoryBot.create_list(:payment, 2, user: user2)

save_money1 = FactoryBot.create(:save_money, title: 'nubank', description: 'Seed Data', user: user1)
save_money2 = FactoryBot.create(:save_money, title: 'inter', description: 'Seed Data', user: user2)

2.times do |time|
  FactoryBot.create(:save_money_wallet, save_money: save_money1, title: "Investimento #{time}", description: "Seed Data")
end

2.times do |time|
  FactoryBot.create(:save_money_wallet, save_money: save_money2, title: "Investimento #{time}", description: "Seed Data")
end

require 'rails_helper'

RSpec.describe "Balance" do
  before do
    @user = FactoryBot.create(:user)
    @payments = FactoryBot.create_list(:payment, 2, value: 150.00, user: @user)
    @receivables = FactoryBot.create_list(:receivable, 2, value: 250.00, user: @user)
    @save_money = FactoryBot.create(:save_money, user: @user)
    @wallet = FactoryBot.create(:save_money_wallet, save_money: @save_money, value: 1000)
  end

  context "payments" do
    it 'total' do
      result = Balance.new({ user: @user }).payment_balance

      expect(result).to eq(300)
    end

    it 'total month' do
      FactoryBot.create(:payment, value: 150.00, date: Time.current, user: @user)
      result = ::Balance.new({ user: @user }).payment_last_month

      expect(result).to eq(150.00)
    end

    it 'total month without exit' do
      FactoryBot.create(:payment, value: 150.00, date: Time.current - 1.month, user: @user)
      result = ::Balance.new({ user: @user }).payment_last_month

      expect(result).to eq(0.00)
    end
  end

  context "receivables" do
    it 'total' do
      result = Balance.new({ user: @user }).receivable_balance

      expect(result).to eq(500)
    end

    it 'total month' do
      FactoryBot.create(:receivable, value: 250.00, date: Time.current, user: @user)
      result = ::Balance.new({ user: @user }).receivable_last_month

      expect(result).to eq(250.00)
    end

    it 'total month without entry' do
      FactoryBot.create(:receivable, value: 150.00, date: Time.current - 1.month, user: @user)
      result = ::Balance.new({ user: @user }).receivable_last_month

      expect(result).to eq(0.00)
    end
  end

  context "balance" do
    it 'receivables - payments' do
      result = Balance.new({ user: @user }).total_balance

      expect(result).to eq(200)
    end
  end

  context "save_money" do
    it 'total' do
      result = Balance.new({ user: @user }).total_balance_wallets

      expect(result).to eq(1000)
    end
  end
end
require 'rails_helper'

RSpec.describe "Balance" do
  before do
    @user = FactoryBot.create(:user)
    @payments = FactoryBot.create_list(:payment, 2, value: 150.00, user: @user)
    @receivables = FactoryBot.create_list(:receivable, 2, value: 250.00, user: @user)
  end

  context "payments" do
    it 'total' do
      result = Balance.new({ payments: @payments }).payment_balance

      expect(result).to eq(300)
    end
  end

  context "receivables" do
    it 'total' do
      result = Balance.new({ receivables: @receivables }).receivable_balance

      expect(result).to eq(500)
    end
  end

  context "total" do
    it 'receivables - payments' do
      result = Balance.new({ payments: @payments, receivables: @receivables }).total_balance

      expect(result).to eq(200)
    end
  end
end
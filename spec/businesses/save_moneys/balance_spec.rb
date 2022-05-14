require 'rails_helper'

RSpec.describe "Balance" do
  before do
    @user = FactoryBot.create(:user)
    @save_money = FactoryBot.create(:save_money, user: @user)
    @wallet = FactoryBot.create(:save_money_wallet, save_money: @save_money, value: 1000)
  end

  context "save_money" do
    it 'total' do
      result = ::SaveMoneys::Balance.new({ save_money: @save_money }).call

      expect(result).to eq(1000)
    end
  end
end
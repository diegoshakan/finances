require 'rails_helper'

RSpec.describe "save_money_wallets/index", type: :view do
  before(:each) do
    assign(:save_money_wallets, [
      SaveMoneyWallet.create!(
        title: "Title",
        description: "MyText",
        value: "9.99",
        user: nil,
        save_money: nil
      ),
      SaveMoneyWallet.create!(
        title: "Title",
        description: "MyText",
        value: "9.99",
        user: nil,
        save_money: nil
      )
    ])
  end

  it "renders a list of save_money_wallets" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

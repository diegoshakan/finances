require 'rails_helper'

RSpec.describe "save_money_wallets/edit", type: :view do
  before(:each) do
    @save_money_wallet = assign(:save_money_wallet, SaveMoneyWallet.create!(
      title: "MyString",
      description: "MyText",
      value: "9.99",
      user: nil,
      save_money: nil
    ))
  end

  it "renders the edit save_money_wallet form" do
    render

    assert_select "form[action=?][method=?]", save_money_wallet_path(@save_money_wallet), "post" do

      assert_select "input[name=?]", "save_money_wallet[title]"

      assert_select "textarea[name=?]", "save_money_wallet[description]"

      assert_select "input[name=?]", "save_money_wallet[value]"

      assert_select "input[name=?]", "save_money_wallet[user_id]"

      assert_select "input[name=?]", "save_money_wallet[save_money_id]"
    end
  end
end

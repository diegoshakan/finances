require 'rails_helper'

RSpec.describe "save_money_wallets/new", type: :view do
  before(:each) do
    assign(:save_money_wallet, SaveMoneyWallet.new(
      title: "MyString",
      description: "MyText",
      value: "9.99",
      user: nil,
      save_money: nil
    ))
  end

  it "renders new save_money_wallet form" do
    render

    assert_select "form[action=?][method=?]", save_money_wallets_path, "post" do

      assert_select "input[name=?]", "save_money_wallet[title]"

      assert_select "textarea[name=?]", "save_money_wallet[description]"

      assert_select "input[name=?]", "save_money_wallet[value]"

      assert_select "input[name=?]", "save_money_wallet[user_id]"

      assert_select "input[name=?]", "save_money_wallet[save_money_id]"
    end
  end
end

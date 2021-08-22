require 'rails_helper'

RSpec.describe "save_money_wallets/show", type: :view do
  before(:each) do
    @save_money_wallet = assign(:save_money_wallet, SaveMoneyWallet.create!(
      title: "Title",
      description: "MyText",
      value: "9.99",
      user: nil,
      save_money: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end

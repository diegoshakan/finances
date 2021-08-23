require 'rails_helper'

RSpec.describe "save_moneys/edit", type: :view do
  before(:each) do
    @save_money = assign(:save_money, SaveMoney.create!(
      title: "MyString",
      description: "MyText",
      user: nil
    ))
  end

  it "renders the edit save_money form" do
    render

    assert_select "form[action=?][method=?]", save_money_path(@save_money), "post" do

      assert_select "input[name=?]", "save_money[title]"

      assert_select "textarea[name=?]", "save_money[description]"

      assert_select "input[name=?]", "save_money[user_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "save_moneys/new", type: :view do
  before(:each) do
    assign(:save_money, SaveMoney.new(
      title: "MyString",
      description: "MyText",
      user: nil
    ))
  end

  it "renders new save_money form" do
    render

    assert_select "form[action=?][method=?]", save_moneys_path, "post" do

      assert_select "input[name=?]", "save_money[title]"

      assert_select "textarea[name=?]", "save_money[description]"

      assert_select "input[name=?]", "save_money[user_id]"
    end
  end
end

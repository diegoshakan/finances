require 'rails_helper'

RSpec.describe "save_moneys/index", type: :view do
  before(:each) do
    assign(:save_moneys, [
      SaveMoney.create!(
        title: "Title",
        description: "MyText",
        user: nil
      ),
      SaveMoney.create!(
        title: "Title",
        description: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of save_moneys" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

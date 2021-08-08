require 'rails_helper'

RSpec.describe "payments/index", type: :view do
  before(:each) do
    assign(:payments, [
      Payment.create!(
        title: "Title",
        description: "MyText",
        value: "9.99"
      ),
      Payment.create!(
        title: "Title",
        description: "MyText",
        value: "9.99"
      )
    ])
  end

  it "renders a list of payments" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end

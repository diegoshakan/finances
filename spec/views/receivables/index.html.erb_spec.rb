require 'rails_helper'

RSpec.describe "receivables/index", type: :view do
  before(:each) do
    assign(:receivables, [
      Receivable.create!(
        title: "Title",
        description: "MyText",
        value: "9.99"
      ),
      Receivable.create!(
        title: "Title",
        description: "MyText",
        value: "9.99"
      )
    ])
  end

  it "renders a list of receivables" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end

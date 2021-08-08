require 'rails_helper'

RSpec.describe "payments/new", type: :view do
  before(:each) do
    assign(:payment, Payment.new(
      title: "MyString",
      description: "MyText",
      value: "9.99"
    ))
  end

  it "renders new payment form" do
    render

    assert_select "form[action=?][method=?]", payments_path, "post" do

      assert_select "input[name=?]", "payment[title]"

      assert_select "textarea[name=?]", "payment[description]"

      assert_select "input[name=?]", "payment[value]"
    end
  end
end

require 'rails_helper'

RSpec.describe "payments/edit", type: :view do
  before(:each) do
    @payment = assign(:payment, Payment.create!(
      title: "MyString",
      description: "MyText",
      value: "9.99"
    ))
  end

  it "renders the edit payment form" do
    render

    assert_select "form[action=?][method=?]", payment_path(@payment), "post" do

      assert_select "input[name=?]", "payment[title]"

      assert_select "textarea[name=?]", "payment[description]"

      assert_select "input[name=?]", "payment[value]"
    end
  end
end

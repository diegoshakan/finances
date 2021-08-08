require 'rails_helper'

RSpec.describe "receivables/new", type: :view do
  before(:each) do
    assign(:receivable, Receivable.new(
      title: "MyString",
      description: "MyText",
      value: "9.99"
    ))
  end

  it "renders new receivable form" do
    render

    assert_select "form[action=?][method=?]", receivables_path, "post" do

      assert_select "input[name=?]", "receivable[title]"

      assert_select "textarea[name=?]", "receivable[description]"

      assert_select "input[name=?]", "receivable[value]"
    end
  end
end

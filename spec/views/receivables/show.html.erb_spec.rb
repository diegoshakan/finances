require 'rails_helper'

RSpec.describe "receivables/show", type: :view do
  before(:each) do
    @receivable = assign(:receivable, Receivable.create!(
      title: "Title",
      description: "MyText",
      value: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
  end
end

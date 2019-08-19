require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      :title => "MyString",
      :text => "",
      :tariff => 1,
      :price => 1,
      :course => nil
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input[name=?]", "rate[title]"

      assert_select "input[name=?]", "rate[text]"

      assert_select "input[name=?]", "rate[tariff]"

      assert_select "input[name=?]", "rate[price]"

      assert_select "input[name=?]", "rate[course_id]"
    end
  end
end

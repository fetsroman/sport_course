require 'rails_helper'

RSpec.describe "rates/edit", type: :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :title => "MyString",
      :text => "",
      :tariff => 1,
      :price => 1,
      :course => nil
    ))
  end

  it "renders the edit rate form" do
    render

    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do

      assert_select "input[name=?]", "rate[title]"

      assert_select "input[name=?]", "rate[text]"

      assert_select "input[name=?]", "rate[tariff]"

      assert_select "input[name=?]", "rate[price]"

      assert_select "input[name=?]", "rate[course_id]"
    end
  end
end

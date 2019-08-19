require 'rails_helper'

RSpec.describe "rates/index", type: :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        :title => "Title",
        :text => "",
        :tariff => 2,
        :price => 3,
        :course => nil
      ),
      Rate.create!(
        :title => "Title",
        :text => "",
        :tariff => 2,
        :price => 3,
        :course => nil
      )
    ])
  end

  it "renders a list of rates" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

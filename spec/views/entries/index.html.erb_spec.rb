require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :name => "Name",
        :winner => false
      ),
      stub_model(Entry,
        :name => "Name",
        :winner => false
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end

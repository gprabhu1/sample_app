require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :name => "Name",
      :winner => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
  end
end

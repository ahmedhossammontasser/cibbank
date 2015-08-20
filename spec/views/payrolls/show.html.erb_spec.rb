require 'spec_helper'

describe "payrolls/show" do
  before(:each) do
    @payroll = assign(:payroll, stub_model(Payroll,
      :payroll_amount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end

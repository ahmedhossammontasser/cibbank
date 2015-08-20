require 'spec_helper'

describe "payrolls/index" do
  before(:each) do
    assign(:payrolls, [
      stub_model(Payroll,
        :payroll_amount => 1
      ),
      stub_model(Payroll,
        :payroll_amount => 1
      )
    ])
  end

  it "renders a list of payrolls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

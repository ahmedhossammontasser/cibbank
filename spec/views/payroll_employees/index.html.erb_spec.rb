require 'spec_helper'

describe "payroll_employees/index" do
  before(:each) do
    assign(:payroll_employees, [
      stub_model(PayrollEmployee,
        :amount => 1
      ),
      stub_model(PayrollEmployee,
        :amount => 1
      )
    ])
  end

  it "renders a list of payroll_employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end

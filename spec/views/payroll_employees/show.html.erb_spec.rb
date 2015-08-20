require 'spec_helper'

describe "payroll_employees/show" do
  before(:each) do
    @payroll_employee = assign(:payroll_employee, stub_model(PayrollEmployee,
      :amount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end

require 'spec_helper'

describe "payroll_employees/edit" do
  before(:each) do
    @payroll_employee = assign(:payroll_employee, stub_model(PayrollEmployee,
      :amount => 1
    ))
  end

  it "renders the edit payroll_employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payroll_employees_path(@payroll_employee), :method => "post" do
      assert_select "input#payroll_employee_amount", :name => "payroll_employee[amount]"
    end
  end
end

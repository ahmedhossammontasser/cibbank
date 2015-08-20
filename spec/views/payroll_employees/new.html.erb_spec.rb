require 'spec_helper'

describe "payroll_employees/new" do
  before(:each) do
    assign(:payroll_employee, stub_model(PayrollEmployee,
      :amount => 1
    ).as_new_record)
  end

  it "renders new payroll_employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payroll_employees_path, :method => "post" do
      assert_select "input#payroll_employee_amount", :name => "payroll_employee[amount]"
    end
  end
end

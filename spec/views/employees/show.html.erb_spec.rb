require 'spec_helper'

describe "employees/show" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :employee_name => "Employee Name",
      :employee_branch_code => 1,
      :employee_account_no => "Employee Account No",
      : => 2,
      :employee_currency_code => "Employee Currency Code",
      :employee_debit_credit => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Employee Name/)
    rendered.should match(/1/)
    rendered.should match(/Employee Account No/)
    rendered.should match(/2/)
    rendered.should match(/Employee Currency Code/)
    rendered.should match(/3/)
  end
end

require 'spec_helper'

describe "employees/index" do
  before(:each) do
    assign(:employees, [
      stub_model(Employee,
        :employee_name => "Employee Name",
        :employee_branch_code => 1,
        :employee_account_no => "Employee Account No",
        : => 2,
        :employee_currency_code => "Employee Currency Code",
        :employee_debit_credit => 3
      ),
      stub_model(Employee,
        :employee_name => "Employee Name",
        :employee_branch_code => 1,
        :employee_account_no => "Employee Account No",
        : => 2,
        :employee_currency_code => "Employee Currency Code",
        :employee_debit_credit => 3
      )
    ])
  end

  it "renders a list of employees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Employee Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Employee Account No".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Employee Currency Code".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

require 'spec_helper'

describe "employees/edit" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :employee_name => "MyString",
      :employee_branch_code => 1,
      :employee_account_no => "MyString",
      : => 1,
      :employee_currency_code => "MyString",
      :employee_debit_credit => 1
    ))
  end

  it "renders the edit employee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employees_path(@employee), :method => "post" do
      assert_select "input#employee_employee_name", :name => "employee[employee_name]"
      assert_select "input#employee_employee_branch_code", :name => "employee[employee_branch_code]"
      assert_select "input#employee_employee_account_no", :name => "employee[employee_account_no]"
      assert_select "input#employee_", :name => "employee[]"
      assert_select "input#employee_employee_currency_code", :name => "employee[employee_currency_code]"
      assert_select "input#employee_employee_debit_credit", :name => "employee[employee_debit_credit]"
    end
  end
end

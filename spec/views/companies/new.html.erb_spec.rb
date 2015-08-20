require 'spec_helper'

describe "companies/new" do
  before(:each) do
    assign(:company, stub_model(Company,
      :company_name => "MyString",
      :company_code => 1,
      :Company_account_no => 1,
      :Company_account_no_usd => 1
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
      assert_select "input#company_company_name", :name => "company[company_name]"
      assert_select "input#company_company_code", :name => "company[company_code]"
      assert_select "input#company_Company_account_no", :name => "company[Company_account_no]"
      assert_select "input#company_Company_account_no_usd", :name => "company[Company_account_no_usd]"
    end
  end
end

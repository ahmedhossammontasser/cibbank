require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :company_name => "Company Name",
        :company_code => 1,
        :Company_account_no => 2,
        :Company_account_no_usd => 3
      ),
      stub_model(Company,
        :company_name => "Company Name",
        :company_code => 1,
        :Company_account_no => 2,
        :Company_account_no_usd => 3
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

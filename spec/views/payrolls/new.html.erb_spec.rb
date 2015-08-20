require 'spec_helper'

describe "payrolls/new" do
  before(:each) do
    assign(:payroll, stub_model(Payroll,
      :payroll_amount => 1
    ).as_new_record)
  end

  it "renders new payroll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payrolls_path, :method => "post" do
      assert_select "input#payroll_payroll_amount", :name => "payroll[payroll_amount]"
    end
  end
end

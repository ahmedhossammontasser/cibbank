require 'spec_helper'

describe "payrolls/edit" do
  before(:each) do
    @payroll = assign(:payroll, stub_model(Payroll,
      :payroll_amount => 1
    ))
  end

  it "renders the edit payroll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => payrolls_path(@payroll), :method => "post" do
      assert_select "input#payroll_payroll_amount", :name => "payroll[payroll_amount]"
    end
  end
end

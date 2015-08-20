require "spec_helper"

describe PayrollEmployeesController do
  describe "routing" do

    it "routes to #index" do
      get("/payroll_employees").should route_to("payroll_employees#index")
    end

    it "routes to #new" do
      get("/payroll_employees/new").should route_to("payroll_employees#new")
    end

    it "routes to #show" do
      get("/payroll_employees/1").should route_to("payroll_employees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payroll_employees/1/edit").should route_to("payroll_employees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payroll_employees").should route_to("payroll_employees#create")
    end

    it "routes to #update" do
      put("/payroll_employees/1").should route_to("payroll_employees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payroll_employees/1").should route_to("payroll_employees#destroy", :id => "1")
    end

  end
end

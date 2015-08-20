require "spec_helper"

describe PayrollsController do
  describe "routing" do

    it "routes to #index" do
      get("/payrolls").should route_to("payrolls#index")
    end

    it "routes to #new" do
      get("/payrolls/new").should route_to("payrolls#new")
    end

    it "routes to #show" do
      get("/payrolls/1").should route_to("payrolls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/payrolls/1/edit").should route_to("payrolls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/payrolls").should route_to("payrolls#create")
    end

    it "routes to #update" do
      put("/payrolls/1").should route_to("payrolls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/payrolls/1").should route_to("payrolls#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe ReceivablesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/receivables").to route_to("receivables#index")
    end

    it "routes to #new" do
      expect(get: "/receivables/new").to route_to("receivables#new")
    end

    it "routes to #show" do
      expect(get: "/receivables/1").to route_to("receivables#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/receivables/1/edit").to route_to("receivables#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/receivables").to route_to("receivables#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/receivables/1").to route_to("receivables#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/receivables/1").to route_to("receivables#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/receivables/1").to route_to("receivables#destroy", id: "1")
    end
  end
end

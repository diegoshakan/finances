require "rails_helper"

RSpec.describe SaveMoneysController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/save_moneys").to route_to("save_moneys#index")
    end

    it "routes to #new" do
      expect(get: "/save_moneys/new").to route_to("save_moneys#new")
    end

    it "routes to #show" do
      expect(get: "/save_moneys/1").to route_to("save_moneys#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/save_moneys/1/edit").to route_to("save_moneys#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/save_moneys").to route_to("save_moneys#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/save_moneys/1").to route_to("save_moneys#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/save_moneys/1").to route_to("save_moneys#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/save_moneys/1").to route_to("save_moneys#destroy", id: "1")
    end
  end
end

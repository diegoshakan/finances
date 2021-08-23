require "rails_helper"

RSpec.describe SaveMoneyWalletsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/save_money_wallets").to route_to("save_money_wallets#index")
    end

    it "routes to #new" do
      expect(get: "/save_money_wallets/new").to route_to("save_money_wallets#new")
    end

    it "routes to #show" do
      expect(get: "/save_money_wallets/1").to route_to("save_money_wallets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/save_money_wallets/1/edit").to route_to("save_money_wallets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/save_money_wallets").to route_to("save_money_wallets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/save_money_wallets/1").to route_to("save_money_wallets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/save_money_wallets/1").to route_to("save_money_wallets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/save_money_wallets/1").to route_to("save_money_wallets#destroy", id: "1")
    end
  end
end

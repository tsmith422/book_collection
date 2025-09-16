require "rails_helper"

RSpec.describe UserBooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_books").to route_to("user_books#index")
    end

    it "routes to #new" do
      expect(get: "/user_books/new").to route_to("user_books#new")
    end

    it "routes to #show" do
      expect(get: "/user_books/1").to route_to("user_books#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_books/1/edit").to route_to("user_books#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_books").to route_to("user_books#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_books/1").to route_to("user_books#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_books/1").to route_to("user_books#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_books/1").to route_to("user_books#destroy", id: "1")
    end
  end
end

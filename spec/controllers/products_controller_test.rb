require "rails_helper"

RSpec.describe ProductsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the posts into @product" do
      product1, product2 = Product.create!, Product.create!
      get :index

      expect(assigns(:products)).to match_array([product1, product2])
    end
  end
end
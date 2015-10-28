class CartInfo

  def initialize(user)
	@current_user = user
  end

  def cart_products
	@products = Product.joins(:user_carts).where(user_carts: {user_id: current_user.id}).select('products.product_name, products.product_price, products.product_location_id, products.product_categories, user_carts.product_quantity as cart_product_quantity')
  end

  def user_cart
  	@cart = UserCart.where(:user_id => current_user.id)
  end

 private

  def current_user
	@current_user
  end

end

class UserCartsController < ApplicationController

	def add_to_cart
	end

	def update_items
		user_cart = UserCart.new
		user_cart.user_id = params[:user]
		user_cart.product_id = params[:product]
		user_cart.product_quantity = params[:product_quantity]
		user_cart.save!
		redirect_to show_cart_user_carts_path
	end

	def show_cart
		cart_info = CartInfo.new(current_user)
		@product = cart_info.cart_products
	end

	def clear_cart
		cart_info = CartInfo.new(current_user)
		delete_product = cart_info.user_cart
		delete_product.map(&:destroy)
		redirect_to products_path
	end
end
module UserCartsHelper
	def calulate_price(count, price)
		return "$#{(count * price)}"
	end

	def calulate_sub_total(product)
		sub_total = Array.new
		product.each do |p|
			sum = p.cart_product_quantity * p.product_price
			sub_total << sum
	    end
	    return "$#{sub_total.inject(&:+)}"
	end

	def calulate_tax(product)
		tax = Array.new
		product.each do |p|
			location = find_location(p)
			if location.location == "New Jersey"
			  unless p.product_categories == "Food" ||  p.product_categories == "Clothing"
			  	 sum = p.cart_product_quantity * p.product_price
			  	 product_tax = (sum * location.tax_rates)/100
			  	 tax << product_tax
			  end
			elsif location.location == "California"
				unless p.product_categories == "Food"
			  	 sum = p.cart_product_quantity * p.product_price
			  	 product_tax = (sum * location.tax_rates)/100
			  	 tax << product_tax
			    end  
			end 		
		end
		 round_tax = tax.inject(&:+).round(-1) rescue ''
		return "$#{round_tax}"
	end

	def calculate_total(product)
		sub_total = calulate_sub_total(product)
		calulate_tax = calulate_tax(product)
		grand_total = sub_total.split("$").last.to_i + calulate_tax.split("$").last.to_i
		return "$#{grand_total}"
	end

	def find_location(product_location)
		location = ProductLocation.find(product_location.product_location_id)
		return location
	end

	def show_prodcut_details(product, name)
		find_product = Product.find(product)
		if name == "product_name"
			product_value = find_product.product_name
		elsif name == "product_description"
			product_value = find_product.product_description
		elsif name == "product_categories"
			product_value = find_product.product_categories
		elsif name == "product_price"
			product_value = find_product.product_price
		end
		return product_value
	end

end

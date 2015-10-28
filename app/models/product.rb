class Product < ActiveRecord::Base
	has_many :user_carts
end

class V1::NoticesController < ApplicationController
	before_action: 

	def create 
		@notice = Notice.new(notice_params)
	end

	private

	def notice_params
		params.permit(:customer_id, :product_id, :email, :state)
	end

	def check_product_quantity
		product_quantity = Product.find(params[:product_id])
		if product_quantity > 0
			return true
		else 
			return false
		end
	end
end

class V1::OrdersController < V1::BaseController
  def create
    create_bill_details
  end

  private
    def create_bill
      @bill = Bill.new(customer_id: params[:customer_id], transport_state_id: 1)
      @bill.save
    end

    def set_value_bill_detail
      params[:orders].each do |product|
        product.merge!(bill_id: @bill.id)
      end
    end

    def bill_detail_params(product)
      product.permit(:bill_id, :product_id, :quantity)
    end

    def create_bill_details
      if check_order? && create_bill
        set_value_bill_detail
        params[:orders].each do |product|
          bill_detail = BillDetail.new(bill_detail_params(product))
          bill_detail.save
          update_product_quantity(product)
        end
        render json: {
                      status: 200,
                      success: true,
                      info: "oke mua xong r, luot'"
                      }
      else
        render json: {
                      status: 400,
                      success: false,
                      info: "k mua ddc, yahhh"
                      }
      end
    end

    def check_quantity_product?(product)
      product[:quantity] <= Product.find_by(id: product[:product_id]).quantity
    end

    def check_order?
      flag = true
      params[:orders].each do |product|
        flag &= check_quantity_product?(product)
      end
      flag
    end
    def update_product_quantity(product_params)
      product = Product.find_by(id: product_params[:product_id])
      product.update_attribute(:quantity, product.quantity - product_params[:quantity])
    end
end

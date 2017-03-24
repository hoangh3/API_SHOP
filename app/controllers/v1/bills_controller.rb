class V1::BillsController < ApplicationController
  before_action :create_transport_state, only: [:create]

  def show
    create_bill_params
    render json: {
                  bills_id: @bills_id,
                  created_times: @created_times,
                  prices: @prices,
                  status: 200,
                  success: true,
                  info: "Done!"
                  }
  end

  def create
    # create_bill
    @bill_details = []
    if check_all_bill_details? && create_bill
      params[:shoppingCart].each do |product|
        @bill_details.push(create_bill_detail(product))
        update_product_quantity(product)
      end
      # send email
      @all_bills_details = BillDetail.where(bill_id: @bill.id)
      @user = Customer.find_by(id: params[:user][:id])
      send_success_purchase_email(@user, @all_bills_details)
      # render
      render json: {
                    status: 200,
                    success: true,
                    info: "Done!"
                    }
    else
      render json: {
                    status: 400,
                    success: false,
                    info: "Can't create bill details."
                    }
    end
end

  private

    def create_transport_state
      @transport_state = TransportState.new(status: 1)
      @transport_state.save
    end

    def bill_detail_params(product)
      product[:fashion_name] = product[:name]
      product[:product_price] = product[:price]
      product[:product_id] = product[:id]
      product.permit(:size, :color, :quantity, :fashion_name, :product_price, :product_id)
    end

    def create_bill
      @bill = Bill.new(payment_price: params[:totalMoney],
                       customer_id: params[:user][:id],
                       payment_state: false,
                       transport_state_id: @transport_state[:id])
      @bill.save
    end

    def create_bill_detail(product_in_shopping_cart)
      product = bill_detail_params(product_in_shopping_cart).merge!(bill_id: @bill[:id])
      bill_detail = BillDetail.new(product)
      bill_detail.save
      return bill_detail
    end

    def check_ordered_product_quantity?(product)
      binding.pry
      product[:quantity] <= Product.find_by(id: product[:id]).quantity
    end

    def check_all_bill_details?
      check = true
      params[:shoppingCart].each do |product|
        check &= check_ordered_product_quantity?(product)
      end
      check
    end

    def update_product_quantity(product_params)
      product = Product.find_by(id: product_params[:id])
      product.update_attribute(:quantity, product.quantity - product_params[:quantity])
    end

    def get_all_bills_created_times(user_id)
      all_bills = Bill.where(customer_id: user_id)
      created_time = []
      all_bills.each do |bill|
        created_time.push(bill[:created_at])
      end
      return created_time
    end

    def get_all_bills_prices(user_id)
      all_bills = Bill.where(customer_id: user_id)
      prices = []
      all_bills.each do |bill|
        prices.push(bill[:payment_price])
      end
      return prices
    end

    def get_all_bills_id(user_id)
      all_bills = Bill.where(customer_id: user_id)
      bills_id = []
      all_bills.each do |bill|
        bills_id.push(bill[:id])
      end
      return bills_id
    end

    def create_bill_params
      @created_times = get_all_bills_created_times(params[:id])
      @prices = get_all_bills_prices(params[:id])
      @bills_id = get_all_bills_id(params[:id])
    end

    def send_success_purchase_email(user, bill)
      UserMailer.success_purchase(user, bill).deliver_now
    end

end

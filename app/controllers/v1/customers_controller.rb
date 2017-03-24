class V1::CustomersController < V1::BaseController

  def index
  	@customers = Customer.order(:id).page(params[:page]).per(9)
  	@customers_size = Customer.count
    init_json_customer_response(@customers_size, @customers)
    render json: data
  end

	def show
		# @customer = Customer.find_by(email: params[:email])
    if current_user
      @customer = Customer.find_by(id: @current_user.customer_id)
    else
      #
    end
		render json: @customer
	end

	def create
		@customer = Customer.new(customer_params)
		@customer.save
		render json: @customer
	end

	def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    	render json: @customer
    else
    	render json: :edit
    end
  end

	private
		def customer_params
			params.permit(:name, :email, :address, :phone, :country, :city, :total)
		end

    def current_user
      @current_user ||= User.find_by(id: params[:id])
      if @current_user
        @current_user.authenticated?("authen_token", params[:authen_token])
      else
        return false
      end
    end
end

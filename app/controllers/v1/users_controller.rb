class V1::UsersController < V1::BaseController
	def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @customer = Customer.create(email: params[:user][:email])
      @user = @customer.build_user(user_params)
      if @user.save
        send_activation_email(@user)
        render json: {status: 200,
                      success: "Sign up success, Please check your email to activate your account"}
      else
        render json: {status: 422, errors: @user.errors.full_messages}
      end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_url) unless @user == current_user
    # end

    def send_activation_email(user)
      UserMailer.account_activation(user).deliver_now
    end
end

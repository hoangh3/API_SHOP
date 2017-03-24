class V1::PasswordResetsController < V1::BaseController
  before_action :get_user,      only: [:edit, :update]
  before_action :valid_user,    only: [:edit, :update]
  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user
      @user.reset_token
      send_password_reset_email(@user)
      render json: {
                    status: 200,
                    success: true,
                    info: "Email sent with password reset instructions. Please check email!"
                    }
    else
      render json: {
                    status: 400,
                    success: false,
                    info: "Email address not found"
                    }
    end
  end

  def edit
    render json: {
                  status: 200,
                  success: true,
                  id: params[:password_reset_token],
                  email: params[:email]
                  }
  end

  def update
    if params[:password_reset][:password].empty?
      @user.errors.add(:password, "Password not empty")
      render json: {
                    status: 400,
                    success: false,
                    info: @user.errors.full_messages
                    }
    elsif @user.update_attributes(user_params)
      @user.update_attribute(:reset_digest, nil)
      render json: {
                    status: 200,
                    success: true,
                    info: 'Password has been reset'
                    }
    else
      render json: {
                    status: 400,
                    success: false,
                    info: @user.errors.full_messages
                    }
    end
  end

  private
    def get_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      @user && @user.activated && @user.authenticated?(:reset, params[:id])
    end

    def user_params
      params.require(:password_reset).permit(:password, :password_confirmation)
    end

    def send_password_reset_email(user)
      UserMailer.password_reset(user).deliver_now
    end
end

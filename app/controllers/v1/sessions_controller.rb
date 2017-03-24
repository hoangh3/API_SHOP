class V1::SessionsController < V1::BaseController

	def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      #thanh cong
      if @user.activated
      sign_in @user
      params[:session][:remember] == '1' ? remember(@user) : forget(@user)
      authentication @user
      render json: {user_id: @user.id, token: @user.authentication_token,
                     status: 200, success: 'Login success'}
      else
        render json: {
                      status: 400,
                      success: false,
                      info: 'Account not activated. Please check your email for the activation link.'
                      }
      end
    else
      render json: {status: 400, info: 'Invalid email or password combination'}
    end
	end

  def destroy
    if logged_in?
      sign_out
      render :json =>  {
                          status: 200,
                          :success => true,
                          :info => "sign out",
                        }
    else
      render :json =>  {
                          status: 404,
                          :success => false,
                          :info => "Sorry, You not log out system, but kick out",
                        }
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def sign_in(user)
      session[:user_id] = user.id
    end

    # def current_user
    #   if (user_id = session[:user_id])
    #     @current_user ||= User.find_by(id: user_id)
    #   elsif (user_id = cookies.signed[:user_id])
    #     user = User.find_by(id: user_id)
    #     if user && user.authenticated?(cookies[:remember_token])
    #       log_in user
    #       @current_user = user
    #     end
    #   end
    # end

    # def current_user?(user)
    #   user == current_user
    # end

    def logged_in?
      @current_user.present?
    end

    def sign_out
      @current_user.update_attribute(:authen_token_digest, nil)
      session.delete(:user_id)
      @current_user = nil
    end

    def forget(user)
      user.forget
      # cookies.delete(:user_id)
      # cookies.delete(:remember_token)
    end

    def remember(user)
      user.remember
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end

    def authentication(user)
      user.authentication
    end

end

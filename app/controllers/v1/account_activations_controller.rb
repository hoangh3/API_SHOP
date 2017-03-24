class V1::AccountActivationsController < V1::BaseController
	def edit
    @user = User.find_by(email: params[:email])
    if @user && !@user.activated && @user.authenticated?("activation", params[:id])
      # binding.pry
      @user.activate
      @user.authentication
      render :json, {
                      status: 200,
                      success: true,
                      info: "Account activated!"
                    }
    else
      render :json, {
                      status: 404,
                      success: true,
                      info: "Invalid activation link!"
                    }
    end
  end
end

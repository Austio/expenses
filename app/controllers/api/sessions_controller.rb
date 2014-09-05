class Api::SessionsController < ActionController::Base

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params["password"])
        render json: {success: true, message: "Successfully Logged In!", token: user.set_token}
      else
        render json: {success: false, message: "Please Check Password"}
      end
    else
      render json: {success: false, message: "Username Not Found"}
    end
  end

  def logout
    token = Token.all.find{|t| t.key == params[:key]}
    if token.destroy
      render json: {success: true}
    end
  end
end

class Api::AccountsController < ActionController::Base

  def create
    if User.find_by_email(params[:email])
      render json: {success: false, message: "Duplicate Username!"}
    else
      user = User.create(email: params[:email], password: params[:password])
      render json: {success: true, message: "Account Created, Logging In!", token: user.set_token}
    end
  end
end

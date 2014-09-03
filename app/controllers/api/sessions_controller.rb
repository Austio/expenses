class Api::SessionsController < ActionController::Base

  def create
    user = User.find_by_email(params[:email])
    if user
      if params[:password] == user.password_digest
        return 400
      end
    else
      render json: {success: false, message: 'Invalid User or Password'}
    end
  end
end

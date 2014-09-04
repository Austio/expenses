class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user(key=request.headers.env["HTTP_API_KEY"])
    current_token(key).try(:user)
  end

  #TODO this should not be necessary, can't find token by key in ruby 1.9.3
  def current_token(key)
    Token.all.find{|t| t.key == key}
  end
end

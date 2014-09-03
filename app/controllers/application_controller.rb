class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user(key=request.headers.env["HTTP_API_KEY"])
    Token.all.each {|t| return t.user if t.key == key }
  end
end

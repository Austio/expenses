class Api::ReportsController < ApplicationController
  respond_to :json

  def index
    user = current_user
    if user
      render json: ReportGenerator.by_week(user)
    else
      render json: { message: "Unauthorized"}
    end
  end

end
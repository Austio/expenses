class Api::ReportsController < ApplicationController
  respond_to :json

  def index
    #respond_with current_user.expenses.group_by(&:week).sort
    puts current_user
    puts env
    respond_with ReportGenerator.by_week(current_user)
  end

end
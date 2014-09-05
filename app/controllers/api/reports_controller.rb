class Api::ReportsController < ApplicationController
  respond_to :json

  def index
    #respond_with current_user.expenses.group_by(&:week).sort
    respond_with Expense.all.group_by(&:week)
  end

end
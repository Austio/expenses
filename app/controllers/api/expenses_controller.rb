class Api::ExpensesController < ApplicationController
  respond_to :json


  def index
    respond_with current_user.expenses.all
  end

  def show
    if current_user.id != expense.id
      render json: { message: "Unauthorized"}, status: 403
    else
      respond_with expense
    end
  end

  def create
    puts current_user
    respond_with :api, current_user.expenses.create(expense_params)
  end

  def update
    puts request.headers.env["HTTP_API_KEY"] || "No token present"
    puts current_user(request.headers.env["HTTP_API_KEY"]) || "No User Found"
    respond_with expense.update(expense_params)
  end

  def destroy
    respond_with expense.destroy
  end

  private

  def expense
    Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:comment, :amount, :date)
  end


end
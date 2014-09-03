class Api::ExpensesController < ApplicationController
  respond_to :json

  def index
    respond_with Expense.all
  end

  def show
    respond_with expense
  end

  def create
    respond_with :api, Expense.create(expense_params)
  end

  def update
    puts request.headers.env["HTTP_API_KEY"] || "No token present"
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
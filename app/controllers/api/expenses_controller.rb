class Api::ExpensesController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.expenses.all
  end

  def show
    if authorized?
      respond_with expense
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  def create
    respond_with :api, current_user.expenses.create(expense_params)
  end

  def update
    if authorized?
      respond_with expense.update(expense_params)
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  def destroy
    if authorized?
      respond_with expense.destroy
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  private

  def expense
    Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:comment, :amount, :date)
  end

  def authorized?
    current_user.id == expense.user_id
  end

end
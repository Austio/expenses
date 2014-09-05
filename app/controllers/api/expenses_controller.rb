class Api::ExpensesController < ApplicationController
  respond_to :json

  def index
    user = current_user
    if user
      render json: user.expenses.all
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  def show
    if authorized?
      render json: expense
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  def create
    user = current_user
    if user
      render json: current_user.expenses.create(expense_params)
    else
      render json: { message: "Unauthorized"}, status: 403
    end
  end

  def update
    if authorized?
      render json: expense.update(expense_params)
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
    params.require(:expense).permit(:comment, :amount, :date, :description, :time)
  end

  def authorized?
    current_user.try(:id) == expense.user_id
  end

end
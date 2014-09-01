class Api::ExpensesController < ApplicationController
  respond_to :json

  def index
    respond_with Expense.all
  end

  def show
    respond_with expense
  end

  def create
    respond_with :api, Expense.create(Expense_params)
  end

  def update
    respond_with expense.update(Expense_params)
  end

  def destroy
    respond_with expense.destroy
  end

  private

  def expense
    Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:first_name, :last_name, :email, :phone, :status, :notes)
  end

end
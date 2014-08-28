class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :date, :amount, :comment

end
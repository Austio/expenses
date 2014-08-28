json.array!(@expenses) do |expense|
  json.extract! expense, :id, :date, :amount, :comment
  json.url expense_url(expense, format: :json)
end

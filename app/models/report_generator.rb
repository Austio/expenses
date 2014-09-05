class ReportGenerator
  def self.by_week
    Expenses.all.group_by(&:week).inject({}) do |result, week|
      amount  = week.second.inject(0){ |r,expense| r + expense.amount }
      total_expenses = week.second.count
      average = amount/total_expenses

      result[week.first] = {"amount" => amount, "average" => average, "total_expenses" => total_expenses}
      result
    end

  end
end
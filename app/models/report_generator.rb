class ReportGenerator
  def self.by_week
    Expense.all.group_by(&:week)

  end
end
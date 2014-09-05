class Expense < ActiveRecord::Base
  belongs_to :user

  #used for Api::Reporting to group sets of expenses
  def week
    self.date ? self.date.strftime('%Y-%W') : ('0000-00')
  end
end

class Expense < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :amount
  validates_presence_of :description

  #used for Api::Reporting to group sets of expenses
  def week
    self.date ? self.date.strftime('%Y-%W') : ('0000-00')
  end
end

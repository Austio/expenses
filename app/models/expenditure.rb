class Expenditure < ActiveRecord::Base
  has_one :user, through: :expenditures
end

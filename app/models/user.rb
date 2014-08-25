class User < ActiveRecord::Base
  has_many :expenses, through: :expenditures
  has_secure_password

end

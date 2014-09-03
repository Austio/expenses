class User < ActiveRecord::Base
  has_many :expenses
  has_many :tokens
  has_secure_password

  def set_token
    begin
      key = SecureRandom.hex
    end while Token.find_by_key(key)
    self.tokens.create(:key => key, :expiration => 4.hours.from_now)
    key
  end

end

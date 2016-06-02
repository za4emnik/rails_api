class Session < ActiveRecord::Base
  belongs_to :user
  validates :token, uniqueness: true
  validates :user_id, presence: true


  def self.auth(email, password)
    @user = User.find_by_email(email).authenticate(password)
    raise UnauthorizedError unless @user
    Session.create! user: @user, token: self.generateToken
  end

  private

  def self.generateToken
    SecureRandom.uuid.gsub(/\-/,'')
  end
end

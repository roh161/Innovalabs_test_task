class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: :password_present?

  private

  def password_present?
    password.present?
  end

end

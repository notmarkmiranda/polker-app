class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  has_many :leagues
  has_many :memberships

  def full_name
    first_name && last_name ? "#{first_name} #{last_name}" : email
  end
end

class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :projects
  has_many :comments

  validates :email, presence: true, uniqueness: true

  def to_s
    email
  end
end

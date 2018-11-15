class User < ApplicationRecord
  has_secure_password

  has_many :articles

  before_save {self.email = email.downcase }

  validates :username , presence: true, length:{ minimum:3, maximum:20 },
    uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
    length: { maximum:100 }, format: {with: VALID_EMAIL_REGEX}

  validates :password_digest, presence: true
end
class User < ApplicationRecord
  include NameOfPerson

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  MINIMUM_PASSWORD_LENGTH = 6

  has_secure_password
  has_secure_token :auth_token

  enum role: %w[member admin].index_with { |role| role }

  normalize :email, with: %i[strip downcase]

  validates :first_name, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: MINIMUM_PASSWORD_LENGTH }, allow_blank: true
end

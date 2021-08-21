class PasswordResetForm
  include ActiveModel::Model

  attr_accessor :password, :password_confirmation, :id

  validates \
    :password,
    presence: true,
    length: { minimum: User::MINIMUM_PASSWORD_LENGTH },
    confirmation: true

  def self.model_name
    ActiveModel::Name.new(self, nil, "User")
  end

  def user
    @user ||= User.find_signed!(id, purpose: :password_reset)
  end

  def reset_password
    if valid?
      user.update(password: password)
      true
    else
      false
    end
  end
end

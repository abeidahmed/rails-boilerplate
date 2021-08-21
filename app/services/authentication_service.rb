class AuthenticationService
  def initialize(params)
    @email = params[:email].to_s.downcase
    @password = params[:password]
  end

  def user
    @user ||= User.find_by(email: @email)
    return unless @user

    @user.authenticate(@password) ? @user : nil
  end

  def authenticated?
    user.present?
  end
end

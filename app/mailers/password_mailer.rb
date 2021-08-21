class PasswordMailer < ApplicationMailer
  def password_reset
    @user = params[:user]
    @sgid = params[:sgid]

    mail to: @user.email, subject: "Reset your password"
  end

  def confirm_password_reset
    @user = params[:user]

    mail to: @user.email, subject: "Your password has been changed"
  end
end

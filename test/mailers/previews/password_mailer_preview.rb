# Preview all emails at http://localhost:3000/rails/mailers/password_mailer
class PasswordMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/password_mailer/password_reset
  def password_reset
    user = User.first
    PasswordMailer.with(user: user, sgid: user.id).password_reset
  end

  # Preview this email at http://localhost:3000/rails/mailers/password_mailer/confirm_password_reset
  def confirm_password_reset
    user = User.first
    PasswordMailer.with(user: user).confirm_password_reset
  end
end

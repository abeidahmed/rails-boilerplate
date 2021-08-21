class PasswordResetsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: user_email)

    if user
      sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)
      PasswordMailer.with(user: user, sgid: sgid).password_reset.deliver_later
      redirect_to password_reset_path(user)
    else
      render json: ErrorSerializer.serialize(invalid: ["email address"]), status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find_signed(params[:id], purpose: :password_reset)
    render template: "password_resets/not_found" unless @user
  end

  def update
    form_object = PasswordResetForm.new(user_params.merge(id: params[:id]))

    if form_object.reset_password
      PasswordMailer.with(user: form_object.user).confirm_password_reset.deliver_later
      redirect_to new_sessions_path
    else
      render json: ErrorSerializer.serialize(form_object.errors), status: :unprocessable_entity
    end
  end

  private

  def user_email
    params.dig(:user, :email).to_s.downcase
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

class SessionsController < ApplicationController
  def new; end

  def create
    user = warden.authenticate

    if user
      redirect_to root_path
    else
      render json: ErrorSerializer.serialize(invalid: ["email or password"]), status: :unprocessable_entity
    end
  end

  def destroy
    logout_user
    redirect_to new_sessions_path
  end
end

class ApplicationController < ActionController::Base
  include SetCurrentUserDetails

  private

  def sign_in(user)
    warden.set_user(user)
  end

  def logout_user
    warden.logout
  end

  def warden
    request.env["warden"]
  end
end

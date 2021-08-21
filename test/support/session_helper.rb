module SessionHelper
  include Warden::Test::Helpers

  alias logout_user logout

  def sign_in(user, scope: nil)
    login_as(user, scope: scope)
  end
end

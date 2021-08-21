require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "creating a session for a valid user" do
    user = create(:user)
    post sessions_path, params: { email: user.email, password: user.password }

    assert_equal user.auth_token, signed_cookie[:auth_token]
  end

  test "creating a session for an invalid user" do
    post sessions_path, params: { email: "invalid", password: "invalid" }

    assert signed_cookie[:auth_token].blank?
    assert_equal %i[invalid], error_types
    assert_response :unprocessable_entity
  end
end

require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "creates a user record and stores the auth_token as signed cookie" do
    assert_difference "User.count" do
      post users_path, params: { user: { name: "Jane Doe", email: "jane@doe.com", password: "secret_password" } }
    end

    assert_equal User.first.auth_token, signed_cookie[:auth_token]
  end

  test "creating a user when params is invalid" do
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "Jane Doe", email: "jane@doe.com", password: "" } }
    end

    assert_equal %i[password], error_types
    assert_response :unprocessable_entity
  end
end

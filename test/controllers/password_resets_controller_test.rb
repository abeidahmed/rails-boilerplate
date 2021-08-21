require "test_helper"

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "sends a password reset email if the email is valid" do
    get new_password_reset_path
    assert_response :ok

    user = create(:user)

    assert_emails 1 do
      post password_resets_path, params: { user: { email: user.email.upcase } }
    end
    assert_redirected_to password_reset_path(user)
  end

  test "does not send a password reset email if email is invalid" do
    assert_no_emails do
      post password_resets_path, params: { user: { email: "invalid@example.com" } }
    end
    assert_equal %i[invalid], error_types
    assert_response :unprocessable_entity
  end

  test "showing a user" do
    user = create(:user)
    get password_reset_path(user)

    assert_template :show
  end

  test "editing a password with valid sgid" do
    user = create(:user)
    sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)
    get edit_password_reset_path(sgid)

    assert_template :edit
  end

  test "editing a password with invalid sgid" do
    get edit_password_reset_path("invalid")

    assert_template "password_resets/not_found"
  end

  test "updating a password with valid sgid and params" do
    user = create(:user)
    sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)

    assert_emails 1 do
      patch password_reset_path(sgid), params: { user: { password: "new_password", password_confirmation: "new_password" } }
    end

    user.reload
    assert user.authenticate("new_password")
    assert_redirected_to new_sessions_path
  end

  test "updating a password with invalid sgid and valid params" do
    assert_raise ActiveSupport::MessageVerifier::InvalidSignature do
      patch password_reset_path("invalid"), params: { user: { password: "new_password", password_confirmation: "new_password" } }
    end
    assert_no_emails
  end

  test "updating a password with invalid params" do
    user = create(:user)
    sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)
    patch password_reset_path(sgid), params: { user: { password: "new", password_confirmation: "password" } }

    assert_no_emails
    assert_equal %i[password password_confirmation], error_types
  end
end

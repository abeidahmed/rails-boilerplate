require "application_system_test_case"

class PasswordResetsTest < ApplicationSystemTestCase
  test "redirects to show page after initiating password reset process" do
    user = create(:user)
    visit new_password_reset_path

    assert_selector :link, nil, href: new_sessions_path

    fill_in "user[email]", with: user.email
    click_button "reset"

    assert_current_path password_reset_path(user)
    assert_selector :link, nil, href: new_sessions_path
  end

  test "resetting the password" do
    user = create(:user)
    sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)
    visit edit_password_reset_path(sgid)

    fill_in "user[password]", with: "new_password"
    fill_in "user[password_confirmation]", with: "new_password"
    click_button "Reset password"

    assert_current_path new_sessions_path
  end

  test "password reset not_found template has necessary links" do
    visit edit_password_reset_path("invalid")

    assert_selector :link, nil, href: new_password_reset_path
    assert_selector :link, nil, href: new_sessions_path
    assert_selector :link, nil, href: new_user_path
  end
end

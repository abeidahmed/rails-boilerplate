require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "redirects to home page after logging in" do
    user = create(:user)
    visit new_sessions_path

    assert_selector :link, nil, href: new_user_path
    assert_selector :link, nil, href: new_password_reset_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    assert_current_path root_path
  end
end

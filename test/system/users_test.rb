require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "redirects to home page after signing up" do
    visit new_user_path
    assert_selector :link, nil, href: new_sessions_path

    fill_in "user[name]", with: "John Doe"
    fill_in "user[email]", with: "john@doe.com"
    fill_in "user[password]", with: "secret_password"
    click_button "Sign up"

    assert_current_path root_path
  end
end

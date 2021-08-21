require "test_helper"

class PasswordMailerTest < ActionMailer::TestCase
  test "password_reset" do
    user = create(:user)
    sgid = user.signed_id(expires_in: 2.hours, purpose: :password_reset)
    mail = PasswordMailer.with(user: user, sgid: sgid).password_reset

    assert_equal "Reset your password", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["support@rails_boilerplate.com"], mail.from
    assert_match edit_password_reset_url(sgid), mail.body.encoded
  end

  test "confirm_password_reset" do
    user = create(:user)
    mail = PasswordMailer.with(user: user).confirm_password_reset

    assert_equal "Your password has been changed", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["support@rails_boilerplate.com"], mail.from
    assert_match "support@rails_boilerplate.com", mail.body.encoded
  end
end

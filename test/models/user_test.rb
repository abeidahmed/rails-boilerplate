require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "presence of first name" do
    user = build(:user, first_name: "")

    assert_not user.valid?
    assert_equal ["can't be blank"], user.errors[:first_name]
  end

  test "accepts name parameter" do
    user = create(:user, name: "John Manning")

    assert_equal "John", user.first_name
    assert_equal "Manning", user.last_name
  end

  test "presence of email" do
    user = build(:user, email: "")

    assert_not user.valid?
    assert_equal ["can't be blank", "is invalid"], user.errors[:email]
  end

  test "does not allow duplicate email" do
    create(:user, email: "john@doe.com")
    user = build(:user, email: "JOHN@doe.com")

    assert_not user.valid?
    assert_equal ["has already been taken"], user.errors[:email]
  end

  test "strips out leading and trailing whitespaces and downcases email" do
    user = create(:user, email: "  JOHN@doe.com ")

    assert user.valid?
    assert_equal "john@doe.com", user.email
  end

  test "presence of password" do
    user = build(:user, password: "")

    assert_not user.valid?
    assert_equal ["can't be blank"], user.errors[:password]
  end

  test "length of password is atleast 6 characters" do
    user = build(:user, password: "a" * 5)

    assert_not user.valid?
    assert_equal ["is too short (minimum is 6 characters)"], user.errors[:password]
  end

  test "generates auth_token when user is created" do
    user = create(:user, auth_token: nil)

    assert user.auth_token
  end
end

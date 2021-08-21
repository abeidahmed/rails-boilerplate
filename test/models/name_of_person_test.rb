require "test_helper"

PersonStruct = Class.new(Struct.new(:first_name, :last_name)) do
  include NameOfPerson
end

class NameOfPersonTest < ActiveSupport::TestCase
  def setup
    @user = PersonStruct.new("John", "Manning")
    @name = NameOfPerson::PersonName.new("May", "Weather")
  end

  test "reading name" do
    assert_equal "John Manning", @user.name
  end

  test "writing name" do
    @user.name = NameOfPerson::PersonName.new("May", "Weather")

    assert_equal "May Weather", @user.name
  end

  test "raises an error if first_name is blank" do
    assert_raise ArgumentError do
      NameOfPerson::PersonName.new(nil)
    end
  end

  test "last_name can be omitted" do
    assert_nothing_raised do
      NameOfPerson::PersonName.new("May", nil)
    end
  end

  test "full name of the person" do
    assert_equal "May Weather", @name.full
  end
end

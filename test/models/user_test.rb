require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  def setup
    @user = User.new(name: "Ashvini bhosale", email: "ashu@gmail.com",
                     password: "ashu", password_confirmation: "ashu")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email addresses must be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have limited length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  #   assert true
  # end
end

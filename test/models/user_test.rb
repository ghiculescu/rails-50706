require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can create user" do
    User.delay.echo
  end
end

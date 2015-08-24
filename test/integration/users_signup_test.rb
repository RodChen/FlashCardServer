require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, user: { name:  "",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { email: "Alan@example.com",
                                            name:  "Alan",
                                            password:              "password123",
                                            password_confirmation: "password123" }
    end
    assert_template 'users/show'
  end
end

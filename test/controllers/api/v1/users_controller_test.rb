require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  def setup
    # @request.headers["Accept"] = "application/json"
    @password = "password"
    @user1 = User.new(name: "New User 1", password: @password, email: "user1@example.com")
  end

  # Signup tests
  test "should signup with valid info" do
    post :signup, user: { name: @user1.name, password: @user1.password, email: @user1.email }
    assert_response :created
  end

  test "should not signup without email" do    
    post :signup, user: { name: @user1.name, password: @user1.password }
    assert_response :unprocessable_entity
  end

  test "should not signup without password" do
    post :signup, user: { name: @user1.name, email: @user1.email }
    assert_response :unprocessable_entity
  end

  test "should not signup without name" do
    post :signup, user: { password: @user1.password, email: @user1.email }
    assert_response :unprocessable_entity
  end

  # Login tests
  test "should login with correct email and password and logout" do
    post :login, user: { email: users(:michael).email, password: @password }
    result = JSON.parse(@response.body)
    assert_not_nil result['token'], "did not receive token"
    assert_response :accepted

    @request.headers["Token"] = result['token']
    post :logout
    assert_response :ok   
  end

  test "should not login with wrong email or password" do
    post :login, user: { email: users(:michael).email, password: 'WrongPassword' }
    assert_response :unauthorized  
  end

  # Logout tests
  test "should not logout with wrong token" do
    @request.headers["Token"] = "WrongToken"
    post :logout
    assert_response :unauthorized

    @request.headers["Token"] = ""
    post :logout
    assert_response :unauthorized 
  end

end

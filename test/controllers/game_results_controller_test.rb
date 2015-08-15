require 'test_helper'

class GameResultsControllerTest < ActionController::TestCase
  setup do
    @game_result = game_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_result" do
    assert_difference('GameResult.count') do
      post :create, game_result: { consumed_time: @game_result.consumed_time, correct: @game_result.correct, game_id: @game_result.game_id, problem_id: @game_result.problem_id, user_id: @game_result.user_id }
    end

    assert_redirected_to game_result_path(assigns(:game_result))
  end

  test "should show game_result" do
    get :show, id: @game_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_result
    assert_response :success
  end

  test "should update game_result" do
    patch :update, id: @game_result, game_result: { consumed_time: @game_result.consumed_time, correct: @game_result.correct, game_id: @game_result.game_id, problem_id: @game_result.problem_id, user_id: @game_result.user_id }
    assert_redirected_to game_result_path(assigns(:game_result))
  end

  test "should destroy game_result" do
    assert_difference('GameResult.count', -1) do
      delete :destroy, id: @game_result
    end

    assert_redirected_to game_results_path
  end
end

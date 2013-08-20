require 'test_helper'

class WeighingsControllerTest < ActionController::TestCase
  setup do
    @weighing = weighings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weighings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weighing" do
    assert_difference('Weighing.count') do
      post :create, weighing: { duration: @weighing.duration, weight: @weighing.weight }
    end

    assert_redirected_to weighing_path(assigns(:weighing))
  end

  test "should show weighing" do
    get :show, id: @weighing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weighing
    assert_response :success
  end

  test "should update weighing" do
    put :update, id: @weighing, weighing: { duration: @weighing.duration, weight: @weighing.weight }
    assert_redirected_to weighing_path(assigns(:weighing))
  end

  test "should destroy weighing" do
    assert_difference('Weighing.count', -1) do
      delete :destroy, id: @weighing
    end

    assert_redirected_to weighings_path
  end
end

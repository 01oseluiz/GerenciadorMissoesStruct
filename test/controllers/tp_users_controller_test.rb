require 'test_helper'

class TpUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tp_user = tp_users(:one)
  end

  test "should get index" do
    get tp_users_url
    assert_response :success
  end

  test "should get new" do
    get new_tp_user_url
    assert_response :success
  end

  test "should create tp_user" do
    assert_difference('TpUser.count') do
      post tp_users_url, params: { tp_user: { tipo: @tp_user.tipo } }
    end

    assert_redirected_to tp_user_url(TpUser.last)
  end

  test "should show tp_user" do
    get tp_user_url(@tp_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_tp_user_url(@tp_user)
    assert_response :success
  end

  test "should update tp_user" do
    patch tp_user_url(@tp_user), params: { tp_user: { tipo: @tp_user.tipo } }
    assert_redirected_to tp_user_url(@tp_user)
  end

  test "should destroy tp_user" do
    assert_difference('TpUser.count', -1) do
      delete tp_user_url(@tp_user)
    end

    assert_redirected_to tp_users_url
  end
end

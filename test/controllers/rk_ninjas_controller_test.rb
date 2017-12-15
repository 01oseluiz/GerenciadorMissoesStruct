require 'test_helper'

class RkNinjasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rk_ninja = rk_ninjas(:one)
  end

  test "should get index" do
    get rk_ninjas_url
    assert_response :success
  end

  test "should get new" do
    get new_rk_ninja_url
    assert_response :success
  end

  test "should create rk_ninja" do
    assert_difference('RkNinja.count') do
      post rk_ninjas_url, params: { rk_ninja: { rank: @rk_ninja.rank } }
    end

    assert_redirected_to rk_ninja_url(RkNinja.last)
  end

  test "should show rk_ninja" do
    get rk_ninja_url(@rk_ninja)
    assert_response :success
  end

  test "should get edit" do
    get edit_rk_ninja_url(@rk_ninja)
    assert_response :success
  end

  test "should update rk_ninja" do
    patch rk_ninja_url(@rk_ninja), params: { rk_ninja: { rank: @rk_ninja.rank } }
    assert_redirected_to rk_ninja_url(@rk_ninja)
  end

  test "should destroy rk_ninja" do
    assert_difference('RkNinja.count', -1) do
      delete rk_ninja_url(@rk_ninja)
    end

    assert_redirected_to rk_ninjas_url
  end
end

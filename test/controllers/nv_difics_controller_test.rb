require 'test_helper'

class NvDificsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nv_dific = nv_difics(:one)
  end

  test "should get index" do
    get nv_difics_url
    assert_response :success
  end

  test "should get new" do
    get new_nv_dific_url
    assert_response :success
  end

  test "should create nv_dific" do
    assert_difference('NvDific.count') do
      post nv_difics_url, params: { nv_dific: { nivel: @nv_dific.nivel, preco: @nv_dific.preco } }
    end

    assert_redirected_to nv_dific_url(NvDific.last)
  end

  test "should show nv_dific" do
    get nv_dific_url(@nv_dific)
    assert_response :success
  end

  test "should get edit" do
    get edit_nv_dific_url(@nv_dific)
    assert_response :success
  end

  test "should update nv_dific" do
    patch nv_dific_url(@nv_dific), params: { nv_dific: { nivel: @nv_dific.nivel, preco: @nv_dific.preco } }
    assert_redirected_to nv_dific_url(@nv_dific)
  end

  test "should destroy nv_dific" do
    assert_difference('NvDific.count', -1) do
      delete nv_dific_url(@nv_dific)
    end

    assert_redirected_to nv_difics_url
  end
end

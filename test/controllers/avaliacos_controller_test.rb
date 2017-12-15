require 'test_helper'

class AvaliacosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avaliaco = avaliacos(:one)
  end

  test "should get index" do
    get avaliacos_url
    assert_response :success
  end

  test "should get new" do
    get new_avaliaco_url
    assert_response :success
  end

  test "should create avaliaco" do
    assert_difference('Avaliaco.count') do
      post avaliacos_url, params: { avaliaco: { ID_avaliado: @avaliaco.ID_avaliado, ID_avaliador: @avaliaco.ID_avaliador, avaliacao: @avaliaco.avaliacao } }
    end

    assert_redirected_to avaliaco_url(Avaliaco.last)
  end

  test "should show avaliaco" do
    get avaliaco_url(@avaliaco)
    assert_response :success
  end

  test "should get edit" do
    get edit_avaliaco_url(@avaliaco)
    assert_response :success
  end

  test "should update avaliaco" do
    patch avaliaco_url(@avaliaco), params: { avaliaco: { ID_avaliado: @avaliaco.ID_avaliado, ID_avaliador: @avaliaco.ID_avaliador, avaliacao: @avaliaco.avaliacao } }
    assert_redirected_to avaliaco_url(@avaliaco)
  end

  test "should destroy avaliaco" do
    assert_difference('Avaliaco.count', -1) do
      delete avaliaco_url(@avaliaco)
    end

    assert_redirected_to avaliacos_url
  end
end

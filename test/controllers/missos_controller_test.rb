require 'test_helper'

class MissosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @misso = missos(:one)
  end

  test "should get index" do
    get missos_url
    assert_response :success
  end

  test "should get new" do
    get new_misso_url
    assert_response :success
  end

  test "should create misso" do
    assert_difference('Misso.count') do
      post missos_url, params: { misso: { ID_equipe: @misso.ID_equipe, ID_nv: @misso.ID_nv, ID_pessoa: @misso.ID_pessoa, local: @misso.local, nome: @misso.nome, preco: @misso.preco } }
    end

    assert_redirected_to misso_url(Misso.last)
  end

  test "should show misso" do
    get misso_url(@misso)
    assert_response :success
  end

  test "should get edit" do
    get edit_misso_url(@misso)
    assert_response :success
  end

  test "should update misso" do
    patch misso_url(@misso), params: { misso: { ID_equipe: @misso.ID_equipe, ID_nv: @misso.ID_nv, ID_pessoa: @misso.ID_pessoa, local: @misso.local, nome: @misso.nome, preco: @misso.preco } }
    assert_redirected_to misso_url(@misso)
  end

  test "should destroy misso" do
    assert_difference('Misso.count', -1) do
      delete misso_url(@misso)
    end

    assert_redirected_to missos_url
  end
end

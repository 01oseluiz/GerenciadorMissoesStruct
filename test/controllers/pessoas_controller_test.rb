require 'test_helper'

class PessoasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pessoa = pessoas(:one)
  end

  test "should get index" do
    get pessoas_url
    assert_response :success
  end

  test "should get new" do
    get new_pessoa_url
    assert_response :success
  end

  test "should create pessoa" do
    assert_difference('Pessoa.count') do
      post pessoas_url, params: { pessoa: {rk_ninja_id: @pessoa.ID_Rk, tp_user_id: @pessoa.ID_tp, dataNasc: @pessoa.dataNasc, email: @pessoa.email, endereco: @pessoa.endereco, mediaAv: @pessoa.mediaAv, nome: @pessoa.nome, senha: @pessoa.senha, telefone: @pessoa.telefone, user_name: @pessoa.user_name } }
    end

    assert_redirected_to pessoa_url(Pessoa.last)
  end

  test "should show pessoa" do
    get pessoa_url(@pessoa)
    assert_response :success
  end

  test "should get edit" do
    get edit_pessoa_url(@pessoa)
    assert_response :success
  end

  test "should update pessoa" do
    patch pessoa_url(@pessoa), params: { pessoa: {rk_ninja_id: @pessoa.ID_Rk, tp_user_id: @pessoa.ID_tp, dataNasc: @pessoa.dataNasc, email: @pessoa.email, endereco: @pessoa.endereco, mediaAv: @pessoa.mediaAv, nome: @pessoa.nome, senha: @pessoa.senha, telefone: @pessoa.telefone, user_name: @pessoa.user_name } }
    assert_redirected_to pessoa_url(@pessoa)
  end

  test "should destroy pessoa" do
    assert_difference('Pessoa.count', -1) do
      delete pessoa_url(@pessoa)
    end

    assert_redirected_to pessoas_url
  end
end

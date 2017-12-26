class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update]

  # GET /pessoas
  #def index
  #  @pessoas = Pessoa.all
  #end

  # GET /pessoas/new
  #def new
  #  @pessoa = Pessoa.new
  #end

  # GET /pessoas/1/edit
  def edit
  end

  # PATCH/PUT /pessoas/1
  def update
    if @pessoa.update(pessoa_params)
      flash[:notice] = "Dados atualizados com sucesso."
      redirect_to @pessoa
    else
      flash[:error] = @pessoa.errors
      redirect_to edit_pessoa_path(@pessoa)
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

  def pessoa_params
    params.require(:pessoa).permit(:nome, :identidade, :telefone, :dataNasc,
                                   :endereco, :user_name, :rk_ninja_id,
                                   :tp_user_id, :email)
  end

end

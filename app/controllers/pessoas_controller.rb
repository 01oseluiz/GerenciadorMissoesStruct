class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update]

  # GET /pessoas
  # GET /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html {redirect_to @pessoa, notice: 'Pessoa was successfully updated.'}
        format.json {render :show, status: :ok, location: @pessoa}
      else
        format.html {render :edit}
        format.json {render json: @pessoa.errors, status: :unprocessable_entity}
      end
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

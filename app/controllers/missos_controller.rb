class MissosController < ApplicationController
  before_action :set_misso, only: [:show, :edit, :update, :destroy]

  # GET /missos
  #def index
  #  @missos = Misso.all
  #end

  # GET /missos/1
  def show
  end

  # GET /missos/new
  def new
    @misso = Misso.new
  end

  # GET /missos/1/edit
  def edit
  end

  # POST /missos
  def create
    @misso = Misso.new(misso_params)

    unless equipe_para_missao_valida(@misso)
      redirect_to new_misso_path
      return
    end

    if @misso.save
      if current_pessoa.tipo.downcase == "admin"
        flash[:notice] = "Missão criada com sucesso."
      else
        flash[:notice] = "Missão criada com sucesso. Verifique o valor cobrado pela missão nos dados abaixo."
      end
      redirect_to @misso
    else
      flash[:error] = @misso.errors
      redirect_to new_misso_path
    end
  end

  # PATCH/PUT /missos/1
  def update
    unless equipe_para_missao_valida(Misso.new(misso_params))
      redirect_to edit_misso_path(@misso)
      return
    end

    if @misso.update(misso_params)
      if current_pessoa.tipo.downcase == "admin"
        flash[:notice] = "Missão atualizada com sucesso."
      else
        flash[:notice] = "Missão criada com sucesso. Verifique o valor cobrado pela missão nos dados abaixo."
      end
      redirect_to @misso
    else
      flash[:error] = @misso.errors
      redirect_to edit_misso_path(@misso)
    end
  end

  # DELETE /missos/1
  def destroy
    @misso.destroy
    flash[:notice] = "Missão deletada com sucesso."
    redirect_to main_page_index_url
  end

  private

  def equipe_para_missao_valida(missao)
    if missao.equipe_id == nil
      return true
    end

    equipe_da_missao = Equipe.find(missao.equipe_id)

    if missao.nivel.downcase == "s" or missao.nivel.downcase == "a"
      missao_valida = (equipe_da_missao.is_chuunin_membro or equipe_da_missao.is_genin_membro)
    else
      missao_valida = true
    end

    unless missao_valida
      flash[:warning] = "Missões de nivel 'S' e 'A' devem ser designadas para equipes com ao menos um Chuunin ou Genin."
    end

    missao_valida
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_misso
    @misso = Misso.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def misso_params
    hash = params.require(:misso).permit(:nome, :local, :nv_dific_id, :equipe_id, :preco)
    hash[:pessoa_id] = current_pessoa.id
    hash
  end
end

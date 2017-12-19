class EquipesController < ApplicationController
  before_action :set_equipe, only: [:show, :edit, :update, :destroy]

  # GET /equipes
  # GET /equipes.json
  def index
    @equipes = Equipe.all
  end

  # GET /equipes/1
  # GET /equipes/1.json
  def show
  end

  # GET /equipes/new
  def new
    @equipe = Equipe.new
  end

  # GET /equipes/1/edit
  def edit
  end

  # POST /equipes
  # POST /equipes.json
  def create
    @equipe = Equipe.new(equipe_params)

    unless validar_equipe(@equipe)
      return
    end

    respond_to do |format|
      if @equipe.save
        format.html {redirect_to @equipe, notice: 'Equipe was successfully created.'}
        format.json {render :show, status: :created, location: @equipe}
      else
        format.html {render :new}
        format.json {render json: @equipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /equipes/1
  # PATCH/PUT /equipes/1.json
  def update

    unless validar_equipe(Equipe.new(equipe_params))
      return
    end

    respond_to do |format|
      if @equipe.update(equipe_params)
        format.html {redirect_to @equipe, notice: 'Equipe was successfully updated.'}
        format.json {render :show, status: :ok, location: @equipe}
      else
        format.html {render :edit}
        format.json {render json: @equipe.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /equipes/1
  # DELETE /equipes/1.json
  def destroy
    @equipe.destroy
    respond_to do |format|
      format.html {redirect_to equipes_url, notice: 'Equipe was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_equipe
    @equipe = Equipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def equipe_params
    params.require(:equipe).permit(:nomeEq, :mediaEq, :mb_1_id, :mb_2_id, :mb_3_id, :mb_S_id)
  end

  # Valida a equipe quanto a sua composicao
  def validar_equipe(equipe)
    equipe_valida = true
    if is_raikage_membro(equipe)
      equipe_valida = false
      notificar('O Raikage não pode estar em uma equipe.')

    elsif !is_anbu_equipe(equipe)
      equipe_valida = false
      notificar('Os ninjas ANBU só podem estar em uma equipe em que todos os
membros são ANBU')

    elsif is_medico_membro(equipe)
      unless is_medico_equipe(equipe)
        equipe_valida = false
        notificar('Os ninjas médicos devem estar em uma equipe formada por 3 ninjas
médicos, sendo um deles o superior, e 1 ninja chuunin ou jounin.')

      end
    end
    equipe_valida
  end

  # verifica se ha um medico na equipe
  def is_medico_membro(equipe)
    membros = [equipe.mb_1_id, equipe.mb_2_id, equipe.mb_3_id, equipe.mb_S_id]
    val_is_medico = false

    for i in 0..3
      if Pessoa.find(membros[i]).rank == 'Medico'
        val_is_medico = true
      end
    end

    val_is_medico
  end

  # verifica se a equipe e uma equipe com 3 medicos e um Chunnin ou Jounin
  def is_medico_equipe(equipe)
    membros = [equipe.mb_1_id, equipe.mb_2_id, equipe.mb_3_id, equipe.mb_S_id]
    count_medicos = 0

    for i in 0..3
      if Pessoa.find(membros[i]).rank == 'Medico'
        count_medicos += 1
      elsif Pessoa.find(membros[i]).rank != 'Chuunin' and
          Pessoa.find(membros[i]).rank != 'Jounin'
        return false
      end
    end

    ((count_medicos == 3) and (Pessoa.find(membros[3]).rank == 'Medico'))
  end

  # Verifica se a equipe e formada por anbus
  def is_anbu_equipe(equipe)
    membros = [equipe.mb_1_id, equipe.mb_2_id, equipe.mb_3_id, equipe.mb_S_id]
    val_is_anbu = true

    for i in 0..3
      val_is_anbu = (val_is_anbu and (Pessoa.find(membros[i]).rank == 'ANBU'))
    end
  end

  #verifica se o raikage e um membro da equipe
  def is_raikage_membro(equipe)
    membros = [equipe.mb_1_id, equipe.mb_2_id, equipe.mb_3_id, equipe.mb_S_id]
    val_is_raikage = false

    for i in 0..3
      if Pessoa.find(membros[i]).rank == 'Raikage'
        val_is_raikage = true
      end
    end

    val_is_raikage
  end

  def notificar(mensagem)
    respond_to do |format|
      format.html {redirect_to equipes_url, notice: mensagem}
      format.json {render :new, status: :ok, location: new_equipe_url}
    end
  end
end

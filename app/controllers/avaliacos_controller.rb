class AvaliacosController < ApplicationController
  before_action :set_avaliaco, only: [:show, :edit, :update, :destroy]

  # GET /avaliacos
  #def index
  #  @avaliacos = Avaliaco.all
  #end

  # GET /avaliacos/1
  #def show
  #end

  # GET /avaliacos/new
  def new
    @pessoa = Pessoa.find(params[:pessoa_id])
    @avaliaco = @pessoa.avaliacos.build
  end

  # GET /avaliacos/1/edit
  #def edit
  #end

  # POST /avaliacos
  def create
    @pessoa = Pessoa.find(params[:pessoa_id])
    @avaliaco = @pessoa.avaliacos.build(avaliaco_params)

    if @avaliaco.save
      Equipe.new.update_media_equipe(@pessoa)
      flash[:notice] = "Avaliação realizada com sucesso"
      redirect_to @pessoa
    else
      flash[:error] = @avaliaco.errors
      redirect_to new_pessoa_avaliaco_path
    end
  end

  # PATCH/PUT /avaliacos/1
  #def update
  #  respond_to do |format|
  #    if @avaliaco.update(avaliaco_params)
  #      format.html { redirect_to @avaliaco, notice: 'Avaliaco was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @avaliaco }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @avaliaco.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /avaliacos/1
  #def destroy
  #  @avaliaco.destroy
  #  respond_to do |format|
  #    format.html { redirect_to avaliacos_url, notice: 'Avaliaco was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
  #  def set_avaliaco
  #    @pessoa = Pessoa.find(params[:pessoa_id])
  #    @avaliaco = Avaliaco.find(params[:id])
  #  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def avaliaco_params
    hash = params.require(:avaliaco).permit(:avaliacao)
    hash[:avaliador_id] = current_pessoa.id
    hash
  end
end

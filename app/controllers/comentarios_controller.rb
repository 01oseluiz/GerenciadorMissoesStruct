class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  #def index
  #  @comentarios = Comentario.all
  #end

  # GET /comentarios/1
  #def show
  #end

  # GET /comentarios/new
  def new
    @misso = Misso.find(params[:misso_id])
    @comentario = @misso.comentarios.build
  end

  # GET /comentarios/1/edit
  #def edit
  #end

  # POST /comentarios
  def create
    @misso = Misso.find(params[:misso_id])
    @comentario = @misso.comentarios.build(comentario_params)

    if @comentario.save
      flash[:notice] = "Comentário feito com sucesso."
      redirect_to @misso
    else
      flash[:error] = @comentario.errors
      redirect_to new_misso_comentario_path(@misso)
    end
  end

  # PATCH/PUT /comentarios/1
  #def update
  #  respond_to do |format|
  #    if @comentario.update(comentario_params)
  #      format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @comentario }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @comentario.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /comentarios/1
  #def destroy
  #  @comentario.destroy
  #  respond_to do |format|
  #    format.html { redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_comentario
  #  @comentario = Comentario.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comentario_params
    hash = params.require(:comentario).permit(:cometario, :misso_id, :pessoa_id)
    hash[:pessoa_id] = current_pessoa.id
    hash
  end
end

class MissosController < ApplicationController
  before_action :set_misso, only: [:show, :edit, :update, :destroy]

  # GET /missos
  # GET /missos.json
  def index
    @missos = Misso.all
  end

  # GET /missos/1
  # GET /missos/1.json
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
  # POST /missos.json
  def create
    @misso = Misso.new(misso_params)

    respond_to do |format|
      if @misso.save
        format.html { redirect_to @misso, notice: 'Misso was successfully created.' }
        format.json { render :show, status: :created, location: @misso }
      else
        format.html { render :new }
        format.json { render json: @misso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missos/1
  # PATCH/PUT /missos/1.json
  def update
    respond_to do |format|
      if @misso.update(misso_params)
        format.html { redirect_to @misso, notice: 'Misso was successfully updated.' }
        format.json { render :show, status: :ok, location: @misso }
      else
        format.html { render :edit }
        format.json { render json: @misso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missos/1
  # DELETE /missos/1.json
  def destroy
    @misso.destroy
    respond_to do |format|
      format.html { redirect_to missos_url, notice: 'Misso was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_misso
      @misso = Misso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def misso_params
      params.require(:misso).permit(:nome, :local, :ID_nv, :ID_equipe, :ID_pessoa, :preco)
    end
end

class NvDificsController < ApplicationController
  before_action :set_nv_dific, only: [:show, :edit, :update, :destroy]

  # GET /nv_difics
  # GET /nv_difics.json
  def index
    @nv_difics = NvDific.all
  end

  # GET /nv_difics/1
  # GET /nv_difics/1.json
  def show
  end

  # GET /nv_difics/new
  def new
    @nv_dific = NvDific.new
  end

  # GET /nv_difics/1/edit
  def edit
  end

  # POST /nv_difics
  # POST /nv_difics.json
  def create
    @nv_dific = NvDific.new(nv_dific_params)

    respond_to do |format|
      if @nv_dific.save
        format.html { redirect_to @nv_dific, notice: 'Nv dific was successfully created.' }
        format.json { render :show, status: :created, location: @nv_dific }
      else
        format.html { render :new }
        format.json { render json: @nv_dific.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nv_difics/1
  # PATCH/PUT /nv_difics/1.json
  def update
    respond_to do |format|
      if @nv_dific.update(nv_dific_params)
        format.html { redirect_to @nv_dific, notice: 'Nv dific was successfully updated.' }
        format.json { render :show, status: :ok, location: @nv_dific }
      else
        format.html { render :edit }
        format.json { render json: @nv_dific.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nv_difics/1
  # DELETE /nv_difics/1.json
  def destroy
    @nv_dific.destroy
    respond_to do |format|
      format.html { redirect_to nv_difics_url, notice: 'Nv dific was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nv_dific
      @nv_dific = NvDific.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nv_dific_params
      params.require(:nv_dific).permit(:nivel, :preco)
    end
end

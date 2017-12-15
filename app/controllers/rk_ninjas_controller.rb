class RkNinjasController < ApplicationController
  before_action :set_rk_ninja, only: [:show, :edit, :update, :destroy]

  # GET /rk_ninjas
  # GET /rk_ninjas.json
  def index
    @rk_ninjas = RkNinja.all
  end

  # GET /rk_ninjas/1
  # GET /rk_ninjas/1.json
  def show
  end

  # GET /rk_ninjas/new
  def new
    @rk_ninja = RkNinja.new
  end

  # GET /rk_ninjas/1/edit
  def edit
  end

  # POST /rk_ninjas
  # POST /rk_ninjas.json
  def create
    @rk_ninja = RkNinja.new(rk_ninja_params)

    respond_to do |format|
      if @rk_ninja.save
        format.html { redirect_to @rk_ninja, notice: 'Rk ninja was successfully created.' }
        format.json { render :show, status: :created, location: @rk_ninja }
      else
        format.html { render :new }
        format.json { render json: @rk_ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rk_ninjas/1
  # PATCH/PUT /rk_ninjas/1.json
  def update
    respond_to do |format|
      if @rk_ninja.update(rk_ninja_params)
        format.html { redirect_to @rk_ninja, notice: 'Rk ninja was successfully updated.' }
        format.json { render :show, status: :ok, location: @rk_ninja }
      else
        format.html { render :edit }
        format.json { render json: @rk_ninja.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rk_ninjas/1
  # DELETE /rk_ninjas/1.json
  def destroy
    @rk_ninja.destroy
    respond_to do |format|
      format.html { redirect_to rk_ninjas_url, notice: 'Rk ninja was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rk_ninja
      @rk_ninja = RkNinja.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rk_ninja_params
      params.require(:rk_ninja).permit(:rank)
    end
end

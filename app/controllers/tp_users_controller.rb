class TpUsersController < ApplicationController
  before_action :set_tp_user, only: [:show, :edit, :update, :destroy]

  # GET /tp_users
  #def index
  #  @tp_users = TpUser.all
  #end

  # GET /tp_users/1
  #def show
  #end

  # GET /tp_users/new
  #def new
  #  @tp_user = TpUser.new
  #end

  # GET /tp_users/1/edit
  #def edit
  #end

  # POST /tp_users
  #def create
  #  @tp_user = TpUser.new(tp_user_params)

  #  respond_to do |format|
  #    if @tp_user.save
  #      format.html { redirect_to @tp_user, notice: 'Tp user was successfully created.' }
  #      format.json { render :show, status: :created, location: @tp_user }
  #    else
  #      format.html { render :new }
  #      format.json { render json: @tp_user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PATCH/PUT /tp_users/1
  #def update
  #  respond_to do |format|
  #    if @tp_user.update(tp_user_params)
  #      format.html { redirect_to @tp_user, notice: 'Tp user was successfully updated.' }
  #      format.json { render :show, status: :ok, location: @tp_user }
  #    else
  #      format.html { render :edit }
  #      format.json { render json: @tp_user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /tp_users/1
  #def destroy
  #  @tp_user.destroy
  #  respond_to do |format|
  #    format.html { redirect_to tp_users_url, notice: 'Tp user was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  #private
  # Use callbacks to share common setup or constraints between actions.
  #def set_tp_user
  #  @tp_user = TpUser.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  #def tp_user_params
  #  params.require(:tp_user).permit(:tipo)
  #end
end

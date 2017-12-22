class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show]

  # GET /pessoas
  # GET /pessoas.json
  def index
    @pessoas = Pessoa.all
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pessoa
    @pessoa = Pessoa.find(params[:id])
  end

end

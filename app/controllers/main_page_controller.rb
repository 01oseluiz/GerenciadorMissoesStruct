class MainPageController < ApplicationController
  def index
    @ninjas = Pessoa.all.order(mediaAv: :desc).limit(10)
    @equipes = Equipe.new.best_equipes
  end
end

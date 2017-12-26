class MainPageController < ApplicationController
  def index
    @equipes = Equipe.new.best_equipes
  end
end

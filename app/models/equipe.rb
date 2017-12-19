class Equipe < ApplicationRecord

  def get_membro(mb)
    Pessoa.find(mb).nome
  end

  def best_equipes
    equipes = Equipe.all
    equipes_pontuacao = {}

    equipes.each do |equipe|
      pontuacao = calc_missoes_pontuacao(equipe)

      equipes_pontuacao[equipe] = pontuacao
    end

    equipes_pontuacao.sort_by{|x,y| y}.reverse!
  end

  private

  def calc_missoes_pontuacao(equipe)
    pontuacao = 0
    for i in 1..5
      pontuacao += Misso.where(equipe_id: equipe.id, nv_dific_id: i).size * (6-i)
    end
    pontuacao -= (5 - equipe.mediaEq) * 2.5

    if pontuacao > 0
      pontuacao
    else
      0
    end
  end
end

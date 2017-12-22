class Equipe < ApplicationRecord

  def membro_1
    Pessoa.find(self.mb_1_id).nome
  end

  def membro_2
    Pessoa.find(self.mb_2_id).nome
  end

  def membro_3
    Pessoa.find(self.mb_3_id).nome
  end

  def membro_s
    Pessoa.find(self.mb_S_id).nome
  end

  def best_equipes
    equipes = Equipe.all
    equipes_pontuacao = {}

    equipes.each do |equipe|
      pontuacao = calc_missoes_pontuacao(equipe)

      equipes_pontuacao[equipe] = pontuacao
    end

    equipes_pontuacao.sort_by {|x, y| y}.reverse!
  end

  def buscar_por(key_busca)

    if key_busca == ""
      buscar_por_todos
    elsif key_busca.class == Fixnum
      busca_por_id(key_busca)
    elsif verifica_se_busca_por_rank(key_busca)
      busca_por_rank(key_busca)
    else
      busca_por_nome_equipe(key_busca)
    end

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

  def verifica_se_busca_por_rank(key_busca)
    is_busca_por_rank = false

    RkNinja.all.drop(2).each do |rkninja|
      is_busca_por_rank = (is_busca_por_rank or (key_busca.downcase == rkninja.rank.downcase))
    end

    is_busca_por_rank
  end

  def buscar_por_todos
    Equipe.all
  end

  def busca_por_id(key_busca)
    Equipe.where(id: key_busca)
  end

  def busca_por_nome_equipe(key_busca)
    Equipe.where(nomeEq: key_busca)
  end

  def busca_por_rank(key_busca)
    retorno_busca = []

    Equipe.all.each do |equipe|
      mb_s = Pessoa.where(id: equipe.mb_S_id).first
      if mb_s.rank.downcase == key_busca.downcase
        retorno_busca.push(equipe)
      end
    end

    retorno_busca
  end
end

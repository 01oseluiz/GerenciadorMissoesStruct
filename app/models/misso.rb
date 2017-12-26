class Misso < ApplicationRecord
  has_many :comentarios, dependent: :destroy

  def buscar_por(key_busca)
    if key_busca == ""
      buscar_por_todos
    elsif key_busca == "--"
      buscar_por_sem_equipe
    elsif !(retorno = buscar_por_id(key_busca)).empty?
      retorno
    elsif !(retorno = buscar_por_nome(key_busca)).empty?
      retorno
    elsif !(retorno = buscar_por_pessoa(key_busca)).empty?
      retorno
    elsif !(retorno = buscar_por_equipe(key_busca)).empty?
      retorno
    elsif !(retorno = buscar_por_local(key_busca)).empty?
      retorno
    else
      []
    end
  end

  def nivel
    NvDific.find(self.nv_dific_id).nivel
  end

  def equipe
    if self.equipe_id == nil
      "--"
    else
      Equipe.find(self.equipe_id).nomeEq
    end
  end

  def responsavel
    Pessoa.find(self.pessoa_id).nome
  end

  private

  def buscar_por_todos
    Misso.all
  end

  def buscar_por_sem_equipe
    Misso.where(equipe_id: [false,nil])
  end

  def buscar_por_id(key_busca)
    Misso.where(id: key_busca)
  end

  def buscar_por_nome(key_busca)
    Misso.where(nome: key_busca)
  end

  def buscar_por_pessoa(key_busca)
    retorno_busca = []

    if (pessoa = Pessoa.where(id: key_busca).first) != nil and
        !(retorno_busca = Misso.where(pessoa_id: pessoa.id)).empty?

      retorno_busca

    elsif (pessoa = Pessoa.where(nome: key_busca).first) != nil and
        !(retorno_busca = Misso.where(pessoa_id: pessoa.id)).empty?

      retorno_busca

    end

    retorno_busca
  end

  def buscar_por_equipe(key_busca)
    retorno_busca = []

    if (equipe = Equipe.where(id: key_busca).first) != nil and
        !(retorno_busca = Misso.where(equipe_id: equipe.id)).empty?

      retorno_busca
    elsif (equipe = Equipe.where(nomeEq: key_busca).first) != nil and
        (retorno_busca = Misso.where(equipe_id: equipe.id)).empty?

      retorno_busca
    end

    retorno_busca
  end

  def buscar_por_local(key_busca)
    Misso.where(local: key_busca)
  end
end

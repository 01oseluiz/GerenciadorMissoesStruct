class Comentario < ApplicationRecord
  belongs_to :misso

  def comentado_por
    Pessoa.find(pessoa_id).nome
  end
end

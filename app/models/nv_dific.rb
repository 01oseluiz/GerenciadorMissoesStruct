class NvDific < ApplicationRecord

  def get_opcoes_nivel
    niveis = NvDific.all
    niveis_lista = []

    niveis.each do |x|
      niveis_lista.push([x.nivel,x.id])
    end

    niveis_lista
  end
end

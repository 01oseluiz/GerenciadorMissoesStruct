class Pessoa < ApplicationRecord

  has_many :avaliacos

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def rank
    RkNinja.find(rk_ninja_id).rank
  end

  def tipo
    TpUser.find(tp_user_id).tipo
  end

  def get_opcoes_pessoas
    pessoas = Pessoa.all
    pessoas_lista = []

    pessoas.each do |x|
      pessoas_lista.push([x.nome,x.id])
    end

    pessoas_lista
  end
end
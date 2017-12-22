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
end
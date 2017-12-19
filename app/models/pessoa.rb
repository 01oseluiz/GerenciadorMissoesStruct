class Pessoa < ApplicationRecord
  def rank
    RkNinja.find(rk_ninja_id).rank
  end

  def tipo
    TpUser.find(tp_user_id).tipo
  end
end
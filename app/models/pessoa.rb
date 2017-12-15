class Pessoa < ApplicationRecord
  def rank
    RkNinja.find(self.ID_Rk).rank
  end

  def tipo
    TpUser.find(self.ID_tp).tipo
  end
end

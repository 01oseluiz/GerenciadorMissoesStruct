class Misso < ApplicationRecord
  has_many :comentarios, dependent: :destroy
end

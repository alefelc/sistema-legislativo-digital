class Capitulo < ActiveRecord::Base

  # == Associations
  has_many :capitulos_normas
  has_many :normas, through: :capitulos_normas

  belongs_to :titulo

end

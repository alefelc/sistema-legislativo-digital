class Norma < ActiveRecord::Base

  # == Associations
  has_and_belongs_to_many :clasificacions
  has_and_belongs_to_many :circuitos
  has_and_belongs_to_many :capitulos
  has_and_belongs_to_many :boletin_oficials
  has_and_belongs_to_many :otra_publicacions

  belongs_to :expediente

end

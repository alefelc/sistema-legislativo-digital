class Titulo < ActiveRecord::Base

  # == Associations
  belongs_to :libro
  has_many :capitulos

end

class Capitulo < ActiveRecord::Base

  # == Associations
  has_and_belongs_to_many :normas
  belongs_to :titulo

end

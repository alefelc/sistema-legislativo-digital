class OtraPublicacion < ActiveRecord::Base

  has_and_belongs_to_many :normas

end

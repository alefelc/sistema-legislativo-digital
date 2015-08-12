class EstadoTramite < ActiveRecord::Base

  #== Associations
  belongs_to :tramite

  belongs_to :ref, polymorphic: true

end

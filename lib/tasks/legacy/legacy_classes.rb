# Model particulares
class LegacyPart < ActiveRecord::Base
	establish_connection :legacy
	self.table_name = 'PART'
end

# Model persona juridica
class LegacyJuridica < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'PJUR'
end

# Model concejal
class LegacyConcejal < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'CONCEJAL'
end

# Model comision
class LegacyComision < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'COMIS'
end

# Model periodo
class LegacyPeriodo < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'PERIODOS'
end

# Model bloque
class LegacyBloque < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'BLOQUES'
end

# Model reparticion oficial
class LegacyReparticionOficial < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'REPART'
end

# Model dependencia municipal
class LegacyDependenciaMunicipal < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'DEPEND'
end

# Model expediente
class LegacyExpediente < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'EXPED'

  def self.find_by_ind(ind_exp)
    LegacyExpediente.find_by("IND_EXP = ?", ind_exp)
  end
end

# Model expediente administrativo
class LegacyExpedienteAdministrativo < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'EXPADJ'
end

# Model ordenanza
class LegacyOrdenanza < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'ORDDIG'
end

# Model resolucion
class LegacyResolucion < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'RESOL'
end

# Model tramites
class LegacyTramite < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'TRAMITE'

  def self.find_by_ind(ind_exp)
    LegacyTramite.find_by("IND_EXP = ? AND B_EST = ?", ind_exp, 1)
  end

end

# Model digesto
class LegacyDigesto < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'ESTRUCT'
end

# Model decreto
class LegacyDecreto < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'DECDIG'
end

# Model declaracion
class LegacyDeclaracion < ActiveRecord::Base
  establish_connection :legacy
  self.table_name = 'CLA'
end

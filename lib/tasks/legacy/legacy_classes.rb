
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

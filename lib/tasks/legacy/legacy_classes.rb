
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

# Model periodos
class LegacyPeriodo < ActiveRecord::Base 
  establish_connection :legacy 
  self.table_name = 'PERIODOS'
end


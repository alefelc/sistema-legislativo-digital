# # Model particulares
# class LegacyPart < ActiveRecord::Base
# 	establish_connection :legacy
# 	self.table_name = 'PART'
# end

# # Model persona juridica
# class LegacyJuridica < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'PJUR'
# end

# # Model concejal
# class LegacyConcejal < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'CONCEJAL'
# end

# # Model comision
# class LegacyComision < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'COMIS'
# end

# # Model periodo
# class LegacyPeriodo < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'PERIODOS'
# end

# # Model bloque
# class LegacyBloque < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'BLOQUES'
# end

# # Model reparticion oficial
# class LegacyReparticionOficial < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'REPART'
# end

# # Model dependencia municipal
# class LegacyDependenciaMunicipal < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'DEPEND'
# end

# # Model expediente
# class LegacyExpediente < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'EXPED'

#   def self.find_by_ind(ind_exp)
#     LegacyExpediente.find_by("IND_EXP = ?", ind_exp)
#   end

#   def self.find_by_ind_iniciado(ind_exp)
#     LegacyExpediente.find_by("IND_EXP = ? AND ESTADO = ?", ind_exp, "Iniciado")
#   end
# end

# # Model expediente administrativo
# class LegacyExpedienteAdministrativo < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'EXPADJ'
# end

# # Model ordenanza
# class LegacyOrdenanza < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'ORDDIG'
# end

# # Model resolucion
# class LegacyResolucion < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'RESOL'
# end

# # Model tramites
# class LegacyTramite < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'TRAMITE'

#   def self.find_by_ind(ind_exp)
#     LegacyTramite.find_by("IND_EXP = ? AND B_EST = ?", ind_exp, 1)
#   end

# end

# # Model digesto
# class LegacyDigesto < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'ESTRUCT'
# end

# # Model decreto
# class LegacyDecreto < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'DECDIG'
# end

# # Model declaracion
# class LegacyDeclaracion < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'CLA'
# end

# # Model norma especial
# class LegacyNormaEspecial < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'NORMESP'
# end

# # Model especial a dispositivo
# class LegacyEspecialADispositivo < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'ESPAD'
# end

# # Model ordenanza a dispositivo
# class LegacyOrdenanzaADispositivo < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'ORDAD'
# end

# # Model decreto a dispositivo
# class LegacyDecretoADispositivo < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'DECAD'
# end

# # Model normas a digesto
# class LegacyNormaDigesto < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'NORM_EST'
# end

# # Model claves
# class LegacyClaves < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'P_CLAVE'
# end

# # Model expedientes_claves
# class LegacyExpedientesClaves < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'EXPCLA'
# end

# # Model normas_claves
# class LegacyNormasClaves < ActiveRecord::Base
#   establish_connection :legacy
#   self.table_name = 'VOCLAVE'
# end

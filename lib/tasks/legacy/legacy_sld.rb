# Model tramites

class LegacyAdminUsers < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :admin_users
end

class LegacyComisions < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :comisions
end

class LegacyComisionsDespachos < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :comisions_despachos
end

class LegacyDespachosConcejals < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :despachos_concejals
end

class LegacyExpedientes < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :expedientes
end

class LegacyExpedientesDespachos < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :expedientes_despachos
end

class LegacyPersonas < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :personas
end

class LegacyTramite < ActiveRecord::Base
  establish_connection :sld_legacy
  ActiveRecord::Base.record_timestamps = false
  self.table_name = :tramites
end

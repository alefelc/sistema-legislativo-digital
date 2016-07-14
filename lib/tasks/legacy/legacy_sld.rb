# Model tramites
class LegacyAdminUsers < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :admin_users
end#YA ESTA

class LegacyComisions < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :comisions
end#YA ESTA

class LegacyComisionsDespachos < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :comisions_despachos
end#YA ESTA

class LegacyDespachosConcejals < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :despachos_concejals
end#YA ESTA

class LegacyExpedientes < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :expedientes
end#YA ESTA

class LegacyExpedientesDespachos < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :expedientes_despachos
end#YA ESTA

class LegacyPersonas < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :personas
end#YA ESTA

class LegacyTramite < ActiveRecord::Base
  establish_connection :sld_legacy
  self.table_name = :tramites
end#YA ESTA

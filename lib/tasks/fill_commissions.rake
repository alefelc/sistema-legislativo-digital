namespace :fill do
  desc "Fill commissions"
  task commissions: :environment do
    commissions = Period.last.comisions
    gobierno = commissions.where "denominacion ilike '%gobierno%'"
    economia = commissions.where "denominacion ilike '%economía%'"
    desarrollo_social = commissions.where "denominacion ilike '%desarrollo social%'"
    educacion = commissions.where "denominacion ilike '%educación%'"
    desarrollo_humano = commissions.where "denominacion ilike '%desarrollo humano%'"
    obras_publicas = commissions.where "denominacion ilike '%obras públicas%'"
    servicios_publicos = commissions.where "denominacion ilike '%servicios públicos%'"
    industria = commissions.where "denominacion ilike '%industria%'"
    gestion_ambiental = commissions.where "denominacion ilike '%gestión ambiental%'"
    derechos = commissions.where "denominacion ilike '%derechos%'"
    estado = commissions.where "denominacion ilike '%estado%'"
    labor = commissions.where "denominacion ilike '%labor%'"
  end
end

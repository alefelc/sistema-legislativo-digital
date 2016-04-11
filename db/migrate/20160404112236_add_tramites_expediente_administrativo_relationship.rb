class AddTramitesExpedienteAdministrativoRelationship < ActiveRecord::Migration
  def change
    add_belongs_to :expediente_administrativos, :tramite, index: true
  end
end

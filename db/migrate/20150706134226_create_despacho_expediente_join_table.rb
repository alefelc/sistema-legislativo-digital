class CreateDespachoExpedienteJoinTable < ActiveRecord::Migration
  def change
  	add_reference :tramites, :expediente, index: true
  end
end

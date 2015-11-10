class DependenciaMunicipalsAndTramites < ActiveRecord::Migration
  def change
    create_table :dependencias_tramites, id: false do |t|
      t.belongs_to :dependencia_municipal, index: true
      t.belongs_to :tramite, index: true
    end  
  end
end

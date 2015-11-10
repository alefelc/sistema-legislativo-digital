class OrganoDeGobiernosAndTramites < ActiveRecord::Migration
  def change
    create_table :organo_de_gobiernos_tramites, id: false do |t|
      t.belongs_to :organo_de_gobierno, index: true
      t.belongs_to :tramite, index: true
    end
  end
end

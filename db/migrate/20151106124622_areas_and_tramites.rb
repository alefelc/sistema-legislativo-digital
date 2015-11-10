class AreasAndTramites < ActiveRecord::Migration
  def change
    create_table :areas_tramites, id: false do |t|
      t.belongs_to :area, index: true
      t.belongs_to :tramite, index: true
    end
  end
end

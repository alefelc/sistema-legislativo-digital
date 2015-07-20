class AddColumnYearToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :anio, :date
  end
end

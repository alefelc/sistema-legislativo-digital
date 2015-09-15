ActiveAdmin.register Despacho do

permit_params :id, :nro_fojas, :nro_exp, :anio_exp, :bis_exp, :comision, :concejales_firmantes, :observaciones

  # parent
  menu label: "Despachos"

  config.filters = false

  index title: "Despachos" do
    column "Nro. Trámite", :id
    column "Nro. fojas", :nro_fojas
    column "Nro. Expediente", :nro_exp
    column "Año Expediente", :anio_exp
    column "Bis Expediente", :bis_exp
    column "Comisión", :comision
    column :concejales_firmantes
    column :observaciones
    actions
  end

  show title: proc { |desp| "Nro. Trámite: #{desp.id}" } do
    attributes_table do
      row "Nro. Trámite" do despacho.id end
      row "Nro. Fojas" do despacho.nro_fojas end
      row "Nro. Expediente" do despacho.nro_exp end
      row "Año Expediente" do despacho.anio_exp end
      row "Bis Expediente" do despacho.bis_exp end
      row "Comisión" do despacho.comision end
      row :concejales_firmantes
      row :observaciones
    end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      inputs do end
      inputs "Datos del Expediente" do
        f.input :nro_exp, label: "Nro. Expediente"
        f.input :anio_exp, label: "Año Expediente"
        f.input :bis_exp, label: "Bis Expediente"
      end
      inputs do end
      f.input :comision, label: "Comisión"
      f.input :concejales_firmantes, label: "Concejales Firmantes"
      f.input :observaciones, :input_html => { :rows => 5 }
    end
    f.actions
  end

end

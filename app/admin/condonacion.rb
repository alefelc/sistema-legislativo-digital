ActiveAdmin.register Condonacion do

permit_params :nro_fojas, :iniciador, :domicilio, :telefono, :email, :asunto, :observaciones

  # parent
  menu label: "Condonaciones"

  config.filters = false

  index title: "Condonaciones" do
    column "Nro. Trámite", :id
    column :nro_fojas
    column "Particular", :iniciador
    column :domicilio
    column :telefono
    column :email
    column "Solicitud", :asunto
    column :observaciones
    actions
  end

  show title: proc { |cond| "Nro. Trámite: #{cond.id}" } do
    attributes_table do
      row "Nro. Trámite" do condonacion.id end
      row :nro_fojas
      row "Particular" do condonacion.iniciador end
      row :domicilio
      row :telefono
      row :email
      row "Solicitud" do condonacion.asunto end
      row :observaciones
      row "Creado el" do condonacion.created_at.to_s format: :default end
      row "Actualizado el" do condonacion.updated_at.to_s format: :default end
    end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      f.input :iniciador, label: "Particular"
      f.input :domicilio
      f.input :telefono
      f.input :email
      f.input :asunto, label: "Solicitud", :input_html => { :rows => 5 }
      f.input :observaciones, :input_html => { :rows => 5 }
    end
    f.actions
  end

end

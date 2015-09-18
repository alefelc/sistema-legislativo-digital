ActiveAdmin.register Despacho do

  permit_params :id, :nro_fojas, :nro_exp, :anio_exp, :bis_exp, :comision, :concejales_firmantes, :observaciones, :usuario

  # parent
  menu label: "Despachos"

  filter :id, label: "Nro. Trámite"
  filter :nro_exp, label: "Nro. Expediente"
  filter :comision, label: "Comision"
  filter :concejales_firmantes, label: "Concejales"
  filter :observaciones
  filter :created_at, label: "Creado el"
  filter :updated_at, label: "Actualizado el"

  actions :all

  controller do
    def action_methods
      if current_admin_user.present?
        if current_admin_user.email.split('@')[1] == 'admin.com'
          super
        elsif current_admin_user.email.split('@')[1] == 'invitado.com'
          super - %w[ destroy new create edit ]
        elsif current_admin_user.email.split('@')[1] == 'entrada.com'
          super
        else
          super - %w[ show destroy new create edit ]
        end
      else
        super - %w[ show destroy new create edit ]
      end
    end
  end

  index title: "Despachos" do
    column "Nro. Trámite", :id
    column "Nro. fojas", :nro_fojas
    column "Nro. Expediente", :nro_exp
    column "Bis Expediente", :bis_exp
    column "Comisión", :comision
    column :concejales_firmantes
    column :observaciones
    column "Usuario Resp.", :usuario
    actions
  end

  show title: proc { |desp| "Nro. Trámite: #{desp.id}" } do
    attributes_table do
      row "Nro. Trámite" do despacho.id end
      row "Nro. Fojas" do despacho.nro_fojas end
      row "Nro. Expediente" do despacho.nro_exp end
      row "Bis Expediente" do despacho.bis_exp end
      row "Comisión" do despacho.comision end
      row :concejales_firmantes
      row :observaciones
      row "Creado el" do despacho.created_at end
      row "Actualizado el" do despacho.updated_at end
      row "Actualizado por" do despacho.usuario end
    end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      inputs do end
      inputs "Datos del Expediente" do
        f.input :nro_exp, label: "Nro. Expediente"
        f.input :bis_exp, label: "Bis Expediente"
      end
      inputs do end
      f.input :comision, label: "Comisión"
      f.input :concejales_firmantes, label: "Concejales Firmantes"
      f.input :observaciones, :input_html => { :rows => 5 }
      f.input :usuario, label: "Usuario", :input_html => { readonly: true, class: "usuario-resp" }
    end
    f.actions
  end

end

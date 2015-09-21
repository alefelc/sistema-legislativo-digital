ActiveAdmin.register Despacho do

  permit_params :id, :nro_fojas, :nro_exp, :anio_exp, :bis_exp, :comision, :concejales_firmantes, :observaciones, :usuario, comisions_attributes: [:id, :denominacion, :_destroy], expedientes_attributes: [:id, :nro_exp, :bis_exp, :_destroy]

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
    def update
      super
      expedientes = params[:despacho][:expedientes_attributes]
       if expedientes.present? 
        expedientes.each do |key,value|
          if expedientes[key][:_destroy] == "1"
            exp = Expediente.find(expedientes[key][:id])
            if exp.present?
              exp.delete
            end
          end  
        end
      end
      comisions = params[:despacho][:comisions_attributes]
       if comisions.present? 
        comisions.each do |key,value|
          if comisions[key][:_destroy] == "1"
            com = Comision.find(comisions[key][:id])
            if com.present?
              com.delete
            end
          end  
        end
      end  
    end  
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
    #column "Nro. Expediente", :nro_exp
    #column "Bis Expediente", :bis_exp
    #column "Comisión", :comision
    column :concejales_firmantes
    column :observaciones
    column "Usuario Resp.", :usuario
    actions
  end

  show title: proc { |desp| "Nro. Trámite: #{desp.id}" } do
    attributes_table do
      row "Nro. Trámite" do despacho.id end
      row "Nro. Fojas" do despacho.nro_fojas end
      #row "Nro. Expediente" do despacho.nro_exp end
      #row "Bis Expediente" do despacho.bis_exp end
      #row "Comisión" do despacho.comision end
      row :concejales_firmantes
      row :observaciones
      row "Creado el" do despacho.created_at end
      row "Actualizado el" do despacho.updated_at end
      row "Actualizado por" do despacho.usuario end
    end
    #show expedients
    div :class => "panel" do
          h3 "Expedientes"
          if despacho.expedientes and despacho.expedientes.count > 0
            div :class => "panel_contents" do
              div :class => "attributes_table" do
                table do
                  tbody do
                    despacho.expedientes.each do |comment|
                      tr do
                        td do
                          comment.nro_exp
                        end
                        td do
                          comment.bis
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
    # show comisions
    div :class => "panel" do
          h3 "Comisiones"
          if despacho.comisions and despacho.comisions.count > 0
            div :class => "panel_contents" do
              div :class => "attributes_table" do
                table do
                  tbody do
                    despacho.comisions.each do |comment|
                      tr do
                        td do
                          comment.denominacion
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
  end

  form do |f|
    f.inputs do
      f.input :nro_fojas
      inputs do end
      #inputs "Datos del Expediente" do
        #f.input :nro_exp, label: "Nro. Expediente"
        #f.input :bis_exp, label: "Bis Expediente"
      #end
      f.inputs "Datos del Expediente" do
        f.has_many :expedientes do |exp|
          exp.input :nro_exp, label: "Nro. Expediente"
          exp.input :bis, label: "Bis Expediente"
          exp.input :_destroy, :as=>:boolean, :required => false, :label=>'Eliminar Expediente'        
        end
      end  
      inputs do end
      #f.input :comision, label: "Comisión"
      f.inputs "Comisiones" do
        f.has_many :comisions do |ff|
          ff.input :denominacion, as: :select, collection: Comision.select(:denominacion).distinct.map{|c| c.denominacion}
          ff.input :_destroy, :as=>:boolean, :required => false, :label=>'Eliminar comisión'
        end
      end
      inputs do end
      f.input :concejales_firmantes, label: "Concejales Firmantes"
      f.input :observaciones, :input_html => { :rows => 5 }
      f.input :usuario, label: "Usuario", :input_html => { readonly: true, class: "usuario-resp" }
      #f.has_many :comisions do |datacenter_form|
       # datacenter_form.input :denominacion
        #datacenter_form.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove'        
      #end
    end
    f.actions
  end

end

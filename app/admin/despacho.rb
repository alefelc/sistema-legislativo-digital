ActiveAdmin.register Despacho do

  permit_params :id, :nro_fojas, :nro_exp, :anio_exp, :bis_exp, :comision, :concejales_firmantes, :observaciones, :usuario, comisions_attributes: [:id, :denominacion, :_destroy], expedientes_attributes: [:id, :nro_exp, :bis, :_destroy], concejals_attributes: [:id, :nombre, :_destroy]


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
      concejals = params[:despacho][:concejals_attributes]
       if concejals.present?
        concejals.each do |key,value|
          if concejals[key][:_destroy] == "1"
            con = Concejal.find(concejals[key][:id])
            if con.present?
              con.delete
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
          super - %w[ destroy ]
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
    # column :concejales_firmantes
    column "Expedientes" do |despacho|
      string = ""
      despacho.expedientes.each do |x|
        string << x.nro_exp + "/" + x.bis.to_s + ", "
      end
      string[0..-3]
    end
    column "Comisiones" do |despacho|
      string = ""
      despacho.comisions.each do |x|
        string << x.denominacion + ", "
      end
      string[0..-3]
    end
    column :observaciones
    column "Actualizado", :updated_at
    actions
  end

  show title: proc { |desp| "Nro. Trámite: #{desp.id}" } do
    attributes_table do
      row "Nro. Trámite" do despacho.id end
      row "Nro. Fojas" do despacho.nro_fojas end
      #row "Nro. Expediente" do despacho.nro_exp end
      #row "Bis Expediente" do despacho.bis_exp end
      #row "Comisión" do despacho.comision end
      # row :concejales_firmantes
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
                          comment.nro_exp + " / " + comment.bis.to_s
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
    # show concejals
    div :class => "panel" do
          h3 "Concejales"
          if despacho.concejals and despacho.concejals.count > 0
            div :class => "panel_contents" do
              div :class => "attributes_table" do
                table do
                  tbody do
                    despacho.concejals.each do |comment|
                      tr do
                        td do
                          comment.nombre
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

      f.inputs "Datos del Expediente" do
        f.has_many :expedientes do |exp|
          exp.input :nro_exp, label: "Nro. Expediente"
          exp.input :bis, label: "Bis Expediente"
          exp.input :_destroy, :as=>:boolean, :required => false, :label=>'Quitar Expediente'
        end
      end

      inputs do end

      f.inputs "Comisiones" do
        f.has_many :comisions do |ff|
          ff.input :denominacion, as: :select, collection: Comision.select(:denominacion).distinct.map{|c| c.denominacion}
          ff.input :_destroy, :as=>:boolean, :required => false, :label=>'Quitar comisión'
        end
      end

      inputs do end

      f.inputs "Concejales firmantes" do
        f.has_many :concejals do |ff|
          ff.input :nombre, as: :select, collection: Concejal.all.distinct.map{ |c| c.nombre }
          ff.input :_destroy, :as=>:boolean, :required => false, :label=>'Quitar concejal'
        end
      end

      inputs do end

      f.input :observaciones, :input_html => { :rows => 5 }
      f.input :usuario, label: "Usuario", :input_html => { readonly: true, class: "usuario-resp" }
    end
    f.actions
  end

end

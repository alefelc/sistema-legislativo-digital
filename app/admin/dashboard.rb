ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: "Registro de todos los cambios ocurridos en el sistema" do
    section "Contenido creado/actualizado recientemente" do
      table_for PaperTrail::Version.order('id desc').where.not(whodunnit: nil).limit(200) do
        column ("Registro") { |v| v.item.to_s }
        #column ("Registro") { |v| link_to v.item, [:admin, v.item] } # Uncomment to display as link
        column ("Tipo") { |v| I18n.t("activeadmin.dashboard.#{v.item_type.underscore}") }
        column ("Modificado el") { |v| v.created_at.to_s :long }
        column ("Email usuario") { |v| User.find(v.whodunnit).email }
        column ("Responsable") { |v| User.find(v.whodunnit).person.fullname_with_dni }
      end
    end
  end
end

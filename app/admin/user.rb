ActiveAdmin.register_page "users_list" do
  menu parent: "Usuarios", label: "Registro de usuarios"

  content title: proc{ I18n.t("active_admin.dashboard") } do
    section "Recently updated content" do
      table_for PaperTrail::Version.where(item_type: "User").order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
        column ("Item") { |v| v.item }
        # column ("Item") { |v| link_to v.item, [:admin, v.item] } # Uncomment to display as link
        column ("Type") { |v| v.item_type.underscore.humanize }
        column ("Modified at") { |v| v.created_at.to_s :long }
        column ("Admin") { |v| link_to(User.find(v.whodunnit).email, [:admin, User.find(v.whodunnit)]) if v.whodunnit.present?  }
      end
    end
  end

end

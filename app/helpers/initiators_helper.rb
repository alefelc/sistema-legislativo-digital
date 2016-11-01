module InitiatorsHelper
  def initiator_options
    people = %w( Fisica Juridica )
    options = []
    people.each do |p|
      options << [ I18n.t("initiators.types.#{p}", p)]
    end
    options_for_select(options)
  end
end

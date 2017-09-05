module InitiatorsHelper
  def initiator_options
    people = %w( Fisica Juridica )
    options = []
    people.each do |p|
      options << [ I18n.t("initiators.types.#{p}", p)]
    end
    options_for_select(options)
  end

  def councilors_select
  	options_for_select current_period.concejals.collect { |c| [ c.fullname_with_dni, c.id ] }
  end

  def blocks_select
  	options_from_collection_for_select current_period.bloques, 'id', 'denominacion'
  end

  def commissions_select
  	options_from_collection_for_select current_period.comisions, 'id', 'denominacion'
  end
end

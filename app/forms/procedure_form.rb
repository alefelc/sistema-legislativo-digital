class ProcedureForm
  include ActiveModel::Validations

  attr_reader :sheets, :comisions, :persons, :legislative_files, :initiators

  #== Validations
  validate :commom_fields
  # validate :fields_on_dispatch, if: :procedure_dispatch?
  # validate :initiators_fields, unless: :procedure_dispatch?

  def initialize(params, action=nil, user)
    @sheets = params[:sheets]
    @comisions = params[:comisions]
    @persons = params[:persons]
    @legislative_files = params[:legislative_files]
    @initiators = params[:initiators]
    @type = params[:type]

    @user = user
    @role = user.roles.find { |x| x.activities.index { |r| r.include? 'procedure' } }
    @action = action
  end

  private

  ## Valid if sheets is empty
  def commom_fields
    case @action
    when 'create'
      if sheets.blank? && @role.has_role?(:procedure, :sheets_create)
        errors.add(:sheets, "no puede estar en blanco")
      end
    when 'update'
      if sheets.blank? && @role.has_role?(:procedure, :sheets_update)
        errors.add(:sheets, "no puede estar en blanco")
      end
    end
  end

  ## Check if the procedure is a dispatch
  def procedure_dispatch?
    @type == "Despacho"
  end

  # ## Only validate dispatch fields
  # def fields_on_dispatch
  #   case @action
  #   when 'create'
  #     @role.has? :procedure, :comisions_create
  #     @role.has? :procedure, :persons_create
  #     @role.has? :procedure, :legislative_files_create
  #   when 'update'
  #     @role.has? :procedure, :comisions_create
  #     @role.has? :procedure, :persons_create
  #     @role.has? :procedure, :legislative_files_create
  #   end
  # end

  # ## Validate initiators when the procedure type isn't a dispatch
  def initiators_fields
    case @action
    when 'create'
      if @initiators.blank? && @role.has_role?(:procedure, :initiators_create)
        errors.add(:initiators, "no puede estar en blanco")
      end
    when 'update'
      if @initiators.blank? && @role.has_role?(:procedure, :initiators_update)
        errors.add(:initiators, "no puede estar en blanco")
      end
    end
  end
end

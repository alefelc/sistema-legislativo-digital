class MissingTimestampsOnProcedureSignatories < ActiveRecord::Migration
  def change
    add_timestamps :procedure_signatories
  end
end

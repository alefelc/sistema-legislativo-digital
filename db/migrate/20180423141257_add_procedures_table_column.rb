class AddProceduresTableColumn < ActiveRecord::Migration
  def change
    add_belongs_to :procedures, :legislative_file_originated, index: true
  end
end

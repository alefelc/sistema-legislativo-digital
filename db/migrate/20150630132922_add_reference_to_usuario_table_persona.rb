class AddReferenceToUsuarioTablePersona < ActiveRecord::Migration
  def change
    add_reference :usuarios, :persona, index: true
  end
end

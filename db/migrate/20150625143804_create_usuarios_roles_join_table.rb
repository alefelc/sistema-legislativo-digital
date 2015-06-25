class CreateUsuariosRolesJoinTable < ActiveRecord::Migration
  def change
    create_table :usuarios_rols, id: false do |t|
  		t.belongs_to :usuario , index: true
  		t.belongs_to :rol, index: true
    end
  end
end

class CreateDespachosAndConcejalsJoinTable < ActiveRecord::Migration
  def change
    create_table :despachos_concejals, id: false do |t|
      t.belongs_to :despacho, index: true
      t.belongs_to :concejal, index: true
    end
  end
end

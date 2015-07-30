class AlterTableTags < ActiveRecord::Migration
  def change
    change_table :tags do |t|
      t.remove :expediente_id
    end

    create_table :normas_tags, id: false do |t|
      t.belongs_to :norma, index: true
      t.belongs_to :tag, index: true
    end

    create_table :expedientes_tags, id: false do |t|
      t.belongs_to :expediente, index: true
      t.belongs_to :tag, index: true
    end
  end
end

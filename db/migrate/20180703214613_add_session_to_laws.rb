class AddSessionToLaws < ActiveRecord::Migration
  def change
    add_reference :laws, :legislative_session, index: true, foreign_key: true
  end
end

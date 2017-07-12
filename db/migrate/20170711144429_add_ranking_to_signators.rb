class AddRankingToSignators < ActiveRecord::Migration
  def change
    add_column :procedure_signatories, :ranking, :integer, default: 0, index: true
  end
end

class AddScoresToPicks < ActiveRecord::Migration[6.0]
  def change
    add_column :picks, :awayTeam, :integer
    add_column :picks, :homeTeam, :integer

  end
end

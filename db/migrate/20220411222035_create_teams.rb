class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :lead_id
      t.integer :created_by
      t.integer :modified_by

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.date :start_date
      t.date :target_end_date
      t.date :actual_end_date
      t.integer :created_by
      t.integer :modified_by
      t.integer :bug_id
      t.integer :team_id

      t.timestamps
    end
  end
end

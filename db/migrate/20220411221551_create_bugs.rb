class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :issue_title
      t.text :issue_description
      t.integer :identified_by
      t.date :identified_date
      t.integer :project_id
      t.integer :assigned_to
      t.integer :status
      t.date :status_modified_date
      t.integer :priority
      t.date :target_resolution_date
      t.integer :progress
      t.date :actual_resolution_date
      t.text :resolution_summary
      t.integer :modified_by
      t.integer :approved_by
      t.string :image_url
      t.boolean :approved
      t.integer :comment_id
      t.integer :created_by

      t.timestamps
    end
  end
end

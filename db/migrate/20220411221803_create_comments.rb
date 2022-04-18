class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :comment_text
      t.integer :created_by
      t.integer :bug_id

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :role
      t.integer :team_id
      t.boolean :is_team_lead
      t.string :avatar
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end

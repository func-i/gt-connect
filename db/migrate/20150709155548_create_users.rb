class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :trello_public_key
      t.string :trello_token

      t.timestamps
    end
  end
end

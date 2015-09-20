class AddInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trello_id, :string
    add_column :users, :github_id, :string
  end
end

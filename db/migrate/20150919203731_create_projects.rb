class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :trello_board_id
      t.string :github_repo_id

      t.timestamps
    end
  end
end

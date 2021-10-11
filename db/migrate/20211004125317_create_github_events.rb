class CreateGithubEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :github_events do |t|
      t.string :event_type
      t.boolean :public
      t.integer :repo_id
      t.integer :actor_id

      t.timestamps
    end
  end
end

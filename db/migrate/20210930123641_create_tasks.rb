class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :deadline_at
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
